package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BoundDAO;

@Service
public class BoundService {
	@Inject
	BoundDAO boundDAO;

}
