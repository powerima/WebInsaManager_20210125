<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ include file="../top.jsp" %>
<section>

<div class="m-5">
	<div class="">
		<h4>인사 정보 입력</h4>
	</div>
	
	<div class="container form-control-sm">
		<form class="row" name="inputForm" action="/biz/insa/insaInputForm.do" method="post"
			id="inputForm" onsubmit="return checkInputForm()" enctype="multipart/form-data">
			
			<div class="border row">
				<div class="col-md-12">			
					<button type="reset" class="btn btn-primary btn-sm float-end m-1" onclick="location.href='/biz/insa/insaListForm.do'">이전</button>
					<button type="button" class="btn btn-primary btn-sm float-end m-1" id="insaDeleteAjax">삭제</button>					
					<button type="button" class="btn btn-primary btn-sm float-end m-1" id="insaUpdateAjax">수정</button>
				</div>
			</div>
			<div class="border-start border-end border-bottom row">
				<div class="align-items-start col-md-2 col-sm-12">
					<div class="p-2 bg-light border">
						<c:if test="${insa.profile_image == null}">
			 				<img src="../file/profile_empty.jpg" alt="Generic placeholder image" height="120"/>
		 				</c:if>
		 				<c:if test="${insa.profile_image != null}">
							<img src="/biz/file/profile_img/${insa.profile_image }" alt="Generic placeholder image" height="120">
						</c:if>
		 			</div> 			
			 		<div class="p-1 bg-light border form-control-sm">
			 			<div class="input-group">
							<input type="file" class="form-control form-control-sm" 
							 	name="upload_profile_image" id="upload_profile_image">	
				 			<input type="hidden" name="profile_image" value="${insa.profile_image }">				 
						</div>				
					</div>
				</div>
				
				<div class="row col-md-10">
					<div class="row">
						<div class="col-md-3">
							<label class="form-control-sm" for="sabun">사번</label> 
							<input type="number" class="form-control form-control-sm" name="sabun"
									 id="sabun"	placeholder="사번" value="${insa.sabun }" readonly>				 	
						</div>
						
						<div class="col-md-3">
							<label class="form-control-sm" for="id">아이디</label> 
							<input type="text" class="form-control form-control-sm is-valid" value="${insa.id }"
								name="id" id="id" placeholder="아이디" oninput="id_check(this)" readonly>					
							<div class="valid-feedback">사용할 수 있는 아이디 입니다.</div>
							<div id="div_id_invalid" class="invalid-feedback">아이디를 입력해 주세요.</div>
						</div>
						<div class="col-md-3">
							<label class="form-control-sm" for="pwd">비밀번호</label> 
							<input type="password" class="form-control form-control-sm is-invalid" 
								name="pwd" id="pwd" placeholder="비밀번호" oninput="pwd_check(this)" required>					
							<div id="div_pwd_invalid" class="invalid-feedback">비밀번호를 입력해주세요.</div>
						</div>
						<div class="col-md-3">
							<label class="form-control-sm" for="pwd2">비밀번호 확인</label> 
							<input type="password" class="form-control form-control-sm is-invalid" 
								name="pwd2" id="pwd2" oninput="pwd2_check(this)" placeholder="비밀번호 확인">
							<div class="valid-feedback">비밀번호가 확인 되었습니다.</div>
							<div id="div_pwd2_invalid" class="invalid-feedback"></div>
							<div id="div_pwd2"></div>
						</div>		
					</div>
					<div class="border-start border-end border-bottom row">
						<div class="form-group col-md-3 col-sm-12">
							<label class="form-control-sm" for="name">한글성명</label> 
							<input type="text" class="form-control form-control-sm is-valid" value="${insa.name }"
								name="name" id="name" oninput="name_check(this)" placeholder="한글이름" required>					
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
						<div class="col-md-3 col-sm-12">
							<label class="form-control-sm" for="eng_name">영문성명</label> 
							<input type="text" class="form-control form-control-sm" value="${insa.eng_name }" 
								name="eng_name"	id="eng_name" placeholder="영문성명">
						</div>	
						<div class="col-md-4 col-sm-12">
							<label class="form-control-sm" for="reg_no">주민등록번호</label>
							<div class="input-group " id="reg_no">									
								<input type="text" name="reg_no1" id="reg_no1" maxlength="6" 
									oninput="reg_no_check(this)"  value="${fn:substring(insa.reg_no, 0, 6) }"
									class="form-control form-control-sm is-valid">	
									<span class="form-control-sm">-</span>											
								<input type="text" name="reg_no2" id="reg_no2" 
									maxlength="1" oninput="reg_no_check(this)" value="${fn:substring(insa.reg_no, 7, 8) }"
									class="form-control form-control-sm col-md-1 is-valid">						
								<input type="password" name="reg_no3" id="reg_no3"
									maxlength="6" oninput="reg_no_check(this)" value="${fn:substring(insa.reg_no, 8, 14) }"
									class="form-control form-control-sm is-valid">
								<div class="invalid-feedback">주민등록번호를 입력해주세요.</div>
							</div>											
						</div>		
						<div class="col-md-1 col-sm-12">					
							<label class="form-control-sm" for="age">연령</label> 
							<input type="text" name="age" id="age" oninput="age_check(this)"
								class="form-control form-control-sm" value="${insa.age }">				
						</div>
						<div class="col-md-1 col-sm-12">
							<label class="form-control-sm" for="sex">성별</label> 
							<select id="sex" name="sex" 
								class="form-select form-control form-select-sm">
								<option value="${insa.sex }">${insa.sex }</option>
								<option value="남자">남자</option>
								<option value="여자">여자</option>
							</select>
						</div>		
					</div>
				</div>
			</div>
			
			
			<div class="border-start border-end border-bottom row">
				<div class="col-md-3">
					<label class="form-control-sm" for="hp">핸드폰 번호</label> 
					<input type="text" name="hp" id="hp" maxlength="13" placeholder="핸드폰 번호" value="${insa.hp }"
						oninput="hp_check(this)" class="form-control form-control-sm is-valid">
					<div class="invalid-feedback">핸드폰 번호를 입력해주세요.</div> 
				</div>
				<div class="col-md-3">
					<label class="form-control-sm" for="phone">전화 번호</label> 
					<input type="text" name="phone" id="phone" maxlength="13" placeholder="전화번호"
						oninput="phone_check(this)" class="form-control form-control-sm" value="${insa.phone }">
				</div>
				<div class="col-md-4">
					<label class="form-control-sm" for="input-group-email">Email</label> 
					<div class="input-group" id="input-group-email">
						<c:set var="index_email" value="${fn:indexOf(insa.email, '@') }"/>
						<input type="text" name="email_id" value="${fn:length(insa.email) }"
							class="form-control form-control-sm">
						<span class="form-control-sm">@</span>
						<select name="email_domain1" class="form-select form-control form-select-sm" id="email_domain1">
							<option selected>선택</option>						
							<c:forEach items="${email_domain1_list }" var="email_domain1">
								<option value="${email_domain1.name }">${email_domain1.name }</option>
							</c:forEach>
							<option value="naver.com">naver.com</option>
							<option value="">직접입력</option>	
						</select> 
						<input type="text" name="email_domain2" id="email_domain2" 
								disabled	class="form-control form-control-sm">
					</div>
				</div>	
				<div class="col-md-2">
					<label class="form-control-sm" for="gart_level">등급</label> 
					<select name="gart_level" id="gart_level" 
						class="form-select form-control form-select-sm">
						<option value="${insa.gart_level }" selected>${insa.gart_level } </option>
						<c:forEach items="${gart_level_list }" var="gart_level">
							<option value="${gart_level.name }">${gart_level.name }</option>
						</c:forEach>					
					</select>
				</div>	
			</div>
			<div class="border-start border-end border-bottom row">
				<div class="col-md-3">
					<label class="form-control-sm" for="inputZip">우편 번호</label>
					<div class="input-group">
						<input type="text" name="zip" value="${insa.zip }" class="form-control form-control-sm"
							id="sample4_postcode" placeholder="우편 번호">
						<div class="input-group-append">
							<input type="button" class="btn btn-primary btn-sm" 
								onclick="sample4_execDaumPostcode()" value="주소 검색" />							
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<label class="form-control-sm" for="inputAddress1">도로명 주소</label>
					<input type="text" name="addr1" value="${insa.addr1 }" class="form-control form-control-sm" 
						id="sample4_roadAddress" placeholder="도로명 주소">
					<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"  size="40">
					<span id="guide" style="color:#999;display:none"></span>					
				</div>	
				<div class="col-md-3">
					<label class="form-control-sm" for="inputAddress2">상세 주소</label> 
					<input type="text" name="addr2" value="${insa.addr2 } "class="form-control form-control-sm" 
						id="sample4_detailAddress"	placeholder="상세 주소">
					<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
					<input type="hidden" id="sample4_engAddress" placeholder="영문주소" size="60" >
				</div>
				<div class="col-md-3">
					<label class="form-control-sm" for="join_yn">입사구분</label> 
					<select name="join_yn" id="join_yn" 
						class="form-select form-control form-select-sm">
						<option value="${insa.join_yn }" selected>${insa.join_yn }</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select> 
				</div>
			</div>
			<div class="border-start border-end border-bottom row">
				<div class="col-md-2">
					<label class="form-control-sm" for="pos_gbn_code">직위</label>
					<select name="pos_gbn_code" id="pos_gbn_code"
						class="form-select form-control form-select-sm">
						<option value="${insa.pos_gbn_code }" selected>${insa.pos_gbn_code }</option>
						<c:forEach items="${pos_gbn_code_list }" var="pos_gbn_code">
							<option value="${pos_gbn_code.name }">${pos_gbn_code.name }</option>
						</c:forEach>		
					</select>					
				</div>
				<div class="col-md-2">
					<label class="form-control-sm" for="dept_code">부서</label>
					<select name="dept_code" id="dept_code" 
						class="form-select form-control form-select-sm">
						<option value="${insa.dept_code }" selected>${insa.dept_code }</option>
						<c:forEach items="${dept_code_list }" var="dept_code">
							<option value="${dept_code.name }">${dept_code.name }</option>
						</c:forEach>	
					</select>				
				</div>
				<div class="col-md-2">
					<label class="form-control-sm" for="join_gbn_code">직종</label>
					<select name="join_gbn_code" id="join_gbn_code" 
						class="form-select form-control form-select-sm">
						<option value="${insa.join_gbn_code }" selected>${insa.join_gbn_code }</option>
						<c:forEach items="${join_gbn_code_list }" var="join_gbn_code">
							<option value="${join_gbn_code.name }">${join_gbn_code.name }</option>
						</c:forEach>						
					</select>									
				</div>
				<div class="col-md-2">
					<label class="form-control-sm" for="put_yn">투입여부</label>
					<select name="put_yn" id="put_yn"
						class="form-select form-control form-select-sm">
						<option value="${insa.put_yn }" selected>${insa.put_yn }</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>													
				</div>
				<div class="col-md-4">
					<label class="form-control-sm" for="salary">연봉</label>
					<input type="text" name="salary_str" placeholder="(만원)" id="salary" 
						 oninput="salary_str_check(this)" style="text-align:right"
						 class="form-control form-control-sm" value="${insa.salary }">																
				</div>	
			</div>	
			<div class="border-start border-end border-bottom row">
				<div class="col-md-2">
					<label class="form-control-sm" for="mil_yn">군필 여부</label> 
					<select name="mil_yn" id="mil_yn" 
						class="form-select form-control form-select-sm">
						<option value="${insa.mil_yn }" selected>${insa.mil_yn }</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select> 
				</div>
				<div class="col-md-2">
					<label class="form-control-sm" for="mil_type">군별</label> 
					<select id="mil_type" name="mil_type"
						class="form-select form-control form-select-sm">
						<option value="${insa.mil_type }" selected>${insa.mil_type }</option>
						<c:forEach items="${mil_type_list }" var="mil_type">
							<option value="${mil_type.name }">${mil_type.name }</option>
						</c:forEach>	
					</select>
				</div>
				<div class="col-md-2">
					<label class="form-control-sm" for="mil_level">계급</label> 
					<select id="mil_level" name="mil_level" 
						class="form-select form-control form-select-sm">
						<option value="${insa.mil_level }" selected>${insa.mil_level }</option>
						<c:forEach items="${mil_level_list }" var="mil_level">
							<option value="${mil_level.name }">${mil_level.name }</option>
						</c:forEach>			
					</select>
				</div>
				<div class="col-md-3">
					<label class="form-control-sm" for="mil_startdate">입영일자</label>
					<div class="form-inline "> 
						<input type="text" id="mil_startdate" name="mil_startdate" 
						class="testDatepicker form-control form-control-sm" 
						value="${fn:substring(insa.mil_startdate, 0, 10) }">
					</div>
				</div>
				<div class="col-md-3">
					<label for="mil_enddate">전역일자</label> 
					<div class="form-inline ">
						<input type="text" id="mil_enddate" name="mil_enddate" 
							class="testDatepicker form-control form-control-sm"
							value="${fn:substring(insa.mil_enddate, 0, 10) }">
					</div>					
				</div>			
			</div>
			<div class="border-start border-end border-bottom row">
				<div class="col-md-3">
					<label class="form-control-sm" for="kosa_reg_yn">KOSA 등록</label> 
					<select name="kosa_reg_yn" id="kosa_reg_yn" 
						class="form-select form-control form-select-sm">
						<option value="${insa.kosa_reg_yn }" selected>${insa.kosa_reg_yn }</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select> 
				</div>
				<div class="col-md-3">
					<label class="form-control-sm" for="kosa_class_code">KOSA 등급</label> 
					<select name="kosa_class_code" id="kosa_class_code" 
						class="form-select form-control form-select-sm">
						<option value="${insa.kosa_class_code }" selected>${insa.kosa_class_code }</option>
						<c:forEach items="${kosa_class_code_list }" var="kosa_class_code">
							<option value="${kosa_class_code.name }">${kosa_class_code.name }</option>
						</c:forEach>	
					</select>					
				</div>
				<div class="col-md-3">
					<label class="form-control-sm" for="join_day">입사일자</label>
					<div class="form-inline form-group"> 
						<input type="text" id="join_day" name="join_day" 
						value="${fn:substring(insa.join_day, 0, 10) }"
						class="testDatepicker form-control form-control-sm">
					</div>
				</div>
				<div class="col-md-3">
					<label class="form-control-sm" for="retire_day">퇴사일자</label> 
					<div class="form-inline form-group">
						<input type="text" id="retire_day" name="retire_day" 
							value="${fn:substring(insa.retire_day, 0, 10) }"
							class="testDatepicker form-control form-control-sm">
					</div>					
				</div>
			</div>
			<div class="border-start border-end border-bottom row">
				<div class="col-md-2">
					<label class="form-control-sm" for="kosa_class_code">사업자 번호</label> 
					<input type="text" name="cmp_reg_no" id="cmp_reg_no" maxlength="11"
						value="${insa.cmp_reg_no }" 
						oninput="cmp_reg_no_check(this)"  class="form-control form-control-sm">										
				</div>
				<div class="col-md-2">
					<label class="form-control-sm" for="kosa_class_code">업체명</label> 
					<input type="text" name="crm_name" value="${insa.crm_name }"
						class="form-control form-control-sm">										
				</div>		
				<div class="col-md-2">
					<label class="form-control-sm" for="upload_cmp_reg_image">사업자등록증</label>
					<div class="input-group">
						<input type="file" class="form-control form-control-sm" 
						 	name="upload_cmp_reg_image" id="upload_cmp_reg_image">
					 	<input type="hidden" name="cmp_reg_image" value="${insa.cmp_reg_image }">
					 	<c:if test="${insa.cmp_reg_image != null }">
							<p>[<a href="#cmp_reg_image_modal" rel="modal:open">사업자등록증 확인</a>]</p>
						</c:if>					 
					</div>				
				</div>
				<div class="col-md-2">
					<label class="form-control-sm" for="upload_carrier_image">이력서</label>
					<div class="input-group">
						<input type="file" class="form-control form-control-sm" 
						 	name="upload_carrier_image" id="upload_carrier_image">
						<input type="hidden" name="carrier_image" value="${insa.carrier_image }">
						<c:if test="${insa.carrier_image != null }">
							<div>[<a href="#carrier_image_modal" rel="modal:open">이력서 확인</a>]</div>			
						</c:if>					 
					</div>						
				</div>
				<div class="col-md-4">
					<label class="form-control-sm" for="kosa_reg_yn">자기소개</label> 
					<textarea name="self_intro" class="form-control form-control-sm" 
						aria-label="With textarea">${insa.self_intro }</textarea>
				</div>			
			</div>
		</form>
	</div>
</div>	
			
</section>

<div id="profile_image_modal" class="modal">
	<div align="center">
		<img src="/biz/file/profile_img/${insa.profile_image }" 
			height="600" width="400"/><br>
		<a href="#" rel="modal:close">닫기</a>
	</div>
</div>


<div id="carrier_image_modal" class="modal">
	<div align="center">
		<img src="/biz/file/carrier_img/${insa.carrier_image }" 
			height="600"/><br>
		<a href="#" rel="modal:close">닫기</a>
	</div>
</div>
 
 <div id="cmp_reg_image_modal" class="modal">
	<div align="center">
		<img src="/biz/file/cmp_reg_img/${insa.cmp_reg_image }" 
			height="600"/><br>
		<a href="#" rel="modal:close">닫기</a>
	</div>
</div>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
 <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<script>
var exampleModal = document.getElementById('exampleModal')
exampleModal.addEventListener('show.bs.modal', function (event) {
  // Button that triggered the modal
  var button = event.relatedTarget
  // Extract info from data-bs-* attributes
  var recipient = button.getAttribute('data-bs-whatever')
  // If necessary, you could initiate an AJAX request here
  // and then do the updating in a callback.
  //
  // Update the modal's content.
  var modalTitle = exampleModal.querySelector('.modal-title')
  var modalBodyInput = exampleModal.querySelector('.modal-body input')

  modalTitle.textContent = 'New message to ' + recipient
  modalBodyInput.value = recipient
})
</script>
<%@ include file="../bottom.jsp"%>