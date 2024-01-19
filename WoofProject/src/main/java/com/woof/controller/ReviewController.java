package com.woof.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.woof.domain.Pet;
import com.woof.domain.Review;
import com.woof.service.ReviewService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewService service;

	@Value("${upload.path}")
	private String uploadPath;

	@GetMapping(value = "/getReview")
	public String getPet(Review review, Model model) throws Exception {
		Review review_ = service.getReview(review);
		model.addAttribute("review", review_);
		return "pet/petReview";
	}

	@PostMapping(value = "/getReview")
	public void insertForm(Review review, Model model) throws Exception {
		log.info("/getReview POST");
		service.getReview(review);
	}

	@RequestMapping(value = "/getReviewList")
	public String getReviewList(Review review, Model model) throws Exception {
		log.info("getReviewList");
		List<Review> reviewList = service.getReviewList();
		model.addAttribute("reviewList", reviewList);
		log.info(reviewList.toString());
		return "pet/petReviewList";
	}
	
	//화면에서 누르고 pet/insertPetReview 이동
	@GetMapping(value = "/insertPetReviewForm")
	public String insertPetReviewForm(Review review, Model model) throws Exception {
		return "pet/insertPetReview";
	}

	@GetMapping("/pet/insertPetReview")
	public void insertReview(Model model) throws Exception {
		log.info("/pet/insertPetReview GET");
		model.addAttribute(new Review());
	}

	@PostMapping("/insertPetReview")
	public String insertReview(Review review) throws Exception {
		log.info("/insert POST");
		List<MultipartFile> pictures = review.getPictures();
		for (int i = 0; i < pictures.size(); i++) {
			MultipartFile file = pictures.get(i);
			log.info("originalName" + file.getOriginalFilename());
			log.info("size:" + file.getSize());
			log.info("contentType:" + file.getContentType());
			String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
			if (i == 0) {
				review.setReviewPic(savedName);
			}

		}
		log.info(review.toString());
		service.insertPetReview(review);
		return "redirect:/review/getReviewList";
	}

	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		log.info("UploadFile()");
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/modifyReview")
	public String modifyReivew(Review reivew, Model model) throws Exception {
		log.info("/modifyPetReview GET");
		Review reviewModify = this.service.getReview(reivew);
		log.info(reviewModify.toString());
		model.addAttribute(reviewModify);
		log.info("model add attribute");
		return "pet/modifyPetReview";
	}
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/modifyReview")
	public String modify(Review review,Model model)throws Exception{
		log.info("/modifyReview POST");
		List<MultipartFile> pictures = review.getPictures();
		for(int i = 0; i < pictures.size(); i++) {
			MultipartFile file = pictures.get(i);
			if(file != null && file.getSize() > 0) {
				String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
				if(i == 0) {
					review.setReviewPic(savedName);
				}
			}
		}
		this.service.modifyReview(review);
		model.addAttribute("수정이 완료 되었습니다.");
		return "redirect:/review/getReviewList";
	}
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping(value = "/deleteReview")
	public String deleteReview(Review review,Model model) throws Exception{
		this.service.deleteReview(review);
		return "redirect:/review/getReviewList";
	}
	
	//----------------------------사진 업로드----------------------------------

	@ResponseBody
	@GetMapping("/getReviewPic")
	public ResponseEntity<byte[]> getReviewPic(Integer reviewNo) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String fileName = service.getReviewPic(reviewNo);
		log.info(fileName);
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + File.separator + fileName);
			if (mType != null) {
				headers.setContentType(mType);
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}
	
	private MediaType getMediaType(String formatName) {
		log.info("getMediaType()");
		if (formatName != null) {
			if (formatName.equals("JPG")) {
				return MediaType.IMAGE_JPEG;
			}
			if (formatName.equals("GIF")) {
				return MediaType.IMAGE_GIF;
			}
			if (formatName.equals("PNG")) {
				return MediaType.IMAGE_PNG;
			}
		}
		return null;
	}
}
