package com.action.hotel;

import java.util.Comparator;
import com.model.hotel.HotelDTO;

public class HotelSortPriceMin implements Comparator<HotelDTO> {

	@Override
	public int compare(HotelDTO o1, HotelDTO o2) {
		if (o1.getHotel_price_min() > o2.getHotel_price_min()) {
            return 1;
        } else if (o1.getHotel_price_min() < o2.getHotel_price_min()) {
            return -1;
        }
        return 0;
	}
}