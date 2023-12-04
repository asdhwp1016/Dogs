package com.dogs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dogs.mapper.CommunityMapper;
import com.dogs.model.CommuCateVO;
import com.dogs.model.CommunityVO;
import com.dogs.model.Criteria;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityMapper comMapper;

	@Override
	public void enroll(CommunityVO cvo) {
		comMapper.enroll(cvo);

		if (cvo.getComImageList() == null || cvo.getComImageList().size() <= 0) {
			return;
		}

		cvo.getComImageList().forEach(attach -> {

			attach.setBno(cvo.getBno());
			comMapper.imageEnrollCommu(attach);

		});
	}

	@Override
	public List<CommunityVO> getList() {
		return comMapper.getList();
	}

	@Override
	public CommunityVO getPage(int bno) {
		return comMapper.getPage(bno);
	}
	
	@Transactional
	@Override
	public int modify(CommunityVO cvo) {
		int result = comMapper.modify(cvo);

		if (result == 1 && cvo.getComImageList() != null && cvo.getComImageList().size() > 0) {

			comMapper.deleteComImageAll(cvo.getBno());

			cvo.getComImageList().forEach(attach -> {

				attach.setBno(cvo.getBno());
				comMapper.imageEnrollCommu(attach);
			});
		}
		return result;
	}

	@Override
	public int delete(int bno) {
		return comMapper.delete(bno);
	}

	@Override
	public List<CommunityVO> getListPaging(Criteria cri) {
		return comMapper.getListPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return comMapper.getTotal(cri);
	}

	@Override
	public List<CommuCateVO> cateList() {
		return comMapper.cateList();
	}
	
}
