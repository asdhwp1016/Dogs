package com.dogs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogs.mapper.ComAttachMapper;
import com.dogs.model.ComAttachImageVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ComAttachServiceImpl implements ComAttachService {
	
	@Autowired
	private ComAttachMapper cAttachMapper;

	@Override
	public List<ComAttachImageVO> getComAttachList(int bno) {
		log.info("getComAttachList.........");

		return cAttachMapper.getComAttachList(bno);
	}
}
