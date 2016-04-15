package com.essamine.entity;

import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class UrlEntity extends BaseEntity {

	public String getURL() {
		return getClass().getSimpleName().toLowerCase() + "?id=" + getId();
	}

}
