package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ClientDTO;

@Repository
public class ClientDAO {
	@Inject
	SqlSession sqlSession;
	private static final String namespace = "com.itwillbs.mappers.clientMapper";
	
	public void insertClient(ClientDTO clientDTO) {
		sqlSession.insert(namespace + ".insertClient", clientDTO);		
	}
	
	public List<ClientDTO> getClientList() {
		return sqlSession.selectList(namespace + ".getClientList");
	}

	public List<ClientDTO> getSearchClientList(ClientDTO clientDTO) {
		return sqlSession.selectList(namespace + ".getSearchClientList", clientDTO);
	}

	
	
	
}
