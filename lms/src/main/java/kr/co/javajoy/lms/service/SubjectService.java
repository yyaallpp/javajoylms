package kr.co.javajoy.lms.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.javajoy.lms.CF;
import kr.co.javajoy.lms.mapper.SubjectMapper;
import kr.co.javajoy.lms.vo.Subject;
import kr.co.javajoy.lms.vo.SubjectVideo;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class SubjectService {
@Autowired SubjectMapper subjectMapper;

	// 강좌 입력
	public int addSubject(Subject subject) {
		return subjectMapper.insertSubject(subject);
	}
	
	// 강사 리스트
	public ArrayList<String> getTeacherId() {
		return subjectMapper.selectTeacherId();
	}
	
	// 강좌 리스트(운영자용) 출력
	public Map<String, Object> getSubjectByPage(int currentPage, int rowPerPage) {
		// 리스트 출력 페이징
		int startRow = (currentPage - 1) * rowPerPage;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rowPerPage", rowPerPage);
		map.put("startRow", startRow);
		
		// Mapper에서 반환 된 값 가공
		List<Subject> list = subjectMapper.selectSubjectByPage(map);
		int totalCount = subjectMapper.selectTotalCount();
		int lastPage = (int)(Math.ceil((double)totalCount / (double)rowPerPage));
		
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		
		// 디버깅
		log.debug(CF.PBJ + "SubjectService.selecSubjectListByPage rowPerPage : " + rowPerPage);
		log.debug(CF.PBJ + "SubjectService.selecSubjectListByPage startRow : " + startRow);
		log.debug(CF.PBJ + "SubjectService.selecSubjectListByPage lastPage : " + lastPage );
		log.debug(CF.PBJ + "SubjectService.selecSubjectListByPage list.size() : " + list.size());
		
		return returnMap;
	}
	
	// 강좌 상세보기
	public Subject getSubjectOne(int subjectNo) {
		return subjectMapper.selectSubjectOne(subjectNo);
	}
	
	// 강좌 수정 Form
	public Subject modifySubject(int subjectNo) {
		return subjectMapper.selectSubjectOne(subjectNo);
	}

	// 강좌 수정 Action
	public int modifySubject(Subject subject) {
		return subjectMapper.updateSubject(subject);
	}
	
	// 강의 영상 List
	public List<SubjectVideo> getSubjectVideoList(int subjectNo){
		log.debug(CF.YHJ + "SubjectService.getSubjectVideoList.subjectNo : " +  subjectNo + CF.RESET); // 디버깅
		
		List<SubjectVideo> list = subjectMapper.selectSubjectVideo(subjectNo);
		log.debug(CF.YHJ + "SubjectService.getSubjectVideoList.list : " +  list + CF.RESET); // 디버깅
		
		return list;
	}
	
	public int addSubjectVideo(SubjectVideo subjectVideo) {
		log.debug(CF.YHJ + "SubjectService.addSubjectVideo.subjectVideo : " + subjectVideo + CF.RESET); // 디버깅
		
		return subjectMapper.insertSubjectVideo(subjectVideo);
	}
}




































