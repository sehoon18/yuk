package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ClientDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class ClientDAO {
	@Inject
	SqlSession sqlSession;
	private static final String namespace = "com.itwillbs.mappers.clientMapper";
	
	public void insertClient(ClientDTO clientDTO) {
		System.out.println(clientDTO);
		sqlSession.insert(namespace + ".insertClient", clientDTO);		
	}
	
	public List<ClientDTO> getClientList() {
		return sqlSession.selectList(namespace + ".getClientList");
	}

	public List<ClientDTO> getSearchClientList(ClientDTO clientDTO) {
		return sqlSession.selectList(namespace + ".getSearchClientList", clientDTO);
	}

	public List<ClientDTO> getClientDetail(ClientDTO clientDTO) {
		System.out.println("확인용"+clientDTO);
		
		return sqlSession.selectList(namespace + ".getClientDetail", clientDTO);
	}

	public ClientDTO getClientDetailUpdate(ClientDTO clientDTO) {
		System.out.println("clientDAO getClientDetailUpdate()");
		return sqlSession.selectOne(namespace+".getClientDetailUpdate",clientDTO);
	}

	public void updateClient(ClientDTO clientDTO) {
		System.out.println("clientDAO updateClient()");
		sqlSession.update(namespace+".updateClient",clientDTO);
	}

	public Integer getClinetLastNum() {
		System.out.println("clientDAO getClinetLastNum()");
		return sqlSession.selectOne(namespace + ".getClinetLastNum");
	}

	public List<ClientDTO> getClientPList(PageDTO pageDTO) {
		System.out.println("clientDAO getClientPList()");
		return sqlSession.selectList(namespace + ".getClientPList", pageDTO);
	}

	public int getClientCount(PageDTO pageDTO) {
		System.out.println("clientDAO getClientCount()");
		return sqlSession.selectOne(namespace + ".getClientCount", pageDTO);
	}

	
	
	
}
