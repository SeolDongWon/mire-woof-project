package com.woof.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woof.domain.Carousel;
import com.woof.domain.Notice;
import com.woof.mapper.CarouselMapper;
import com.woof.service.CarouselService;

@Service
public class CarouselServiceImpl implements CarouselService {

	@Autowired 
	private CarouselMapper mapper;

	@Override
	public void insertCarousel(Carousel carousel) throws Exception {
		mapper.insertCarousel(carousel);
		
	}

	@Override
	public void modifyCarousel(Carousel carousel) throws Exception {
		mapper.modifyCarousel(carousel);
		
	}

	@Override
	public void deleteCarousel(Carousel carousel) throws Exception {
		mapper.deleteCarousel(carousel);
		
	}

	@Override
	public List<Carousel> getCarouselList(Carousel carousel) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
