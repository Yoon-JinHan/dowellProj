package com.dowell.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PrtSearchCriteria {
	private String keyword;
	public String getString() {
		return keyword;
	}
}
