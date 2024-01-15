package com.woof.mapper;

import java.util.List;

import com.woof.domain.Carousel;

public interface CarouselMapper {
	
	public void insertCarousel(Carousel carousel) throws Exception;
	
	public void modifyCarousel(Carousel carousel) throws Exception;
	
	public void deleteCarousel(Carousel carousel) throws Exception;
	
	public List<Carousel> getCarouselList(Carousel carousel ) throws Exception;
	
}
