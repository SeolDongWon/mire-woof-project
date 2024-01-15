package com.woof.service;

import java.util.List;

import com.woof.domain.Carousel;
import com.woof.domain.Notice;

public interface CarouselService {

	
	public void insertCarousel(Carousel carousel) throws Exception;
	public void modifyCarousel(Carousel carousel) throws Exception;
	public void deleteCarousel(Carousel carousel) throws Exception;
	public List<Carousel> getCarouselList(Carousel carousel ) throws Exception;
}
