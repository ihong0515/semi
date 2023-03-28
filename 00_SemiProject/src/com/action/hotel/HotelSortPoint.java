package com.action.hotel;

import java.util.Comparator;

import com.model.hotel.HotelDTO;

public class HotelSortPoint implements Comparator<HotelDTO> {

	@Override
	public int compare(HotelDTO o1, HotelDTO o2) {
		if (o1.getHotel_point() < o2.getHotel_point()) {
            return 1;
        } else if (o1.getHotel_point() > o2.getHotel_point()) {
            return -1;
        }
        return 0;
	}
}