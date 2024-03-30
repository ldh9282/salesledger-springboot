package com.iyf.salesledger.common.exception;

/***
 * <pre>
 * CustomExceptionCode 예외 코드
 * 
 * 
 * EP: EmpPool
 * EL: EmpLedger
 * SL: SalesLedger
 * EC: Excel
 * BC: Batch
 * MB: Member
 * AP: API
 * </pre>
 */
public enum CustomExceptionCode {
	
	EP001("EP001", "{0} 인력풀 데이터 등록 중 오류가 발생했습니다."),
	EP002("EP002", "{0} 인력풀 데이터 수정 중 오류가 발생했습니다."),
	EP003("EP003", "{0} 인력풀 데이터 삭제 중 오류가 발생했습니다."),
	EP004("EP004", "{0} 인력풀 데이터 조회 중 오류가 발생했습니다."),
	EL001("EL001", "{0} 인력원장 데이터 등록 중 오류가 발생했습니다."),
	EL002("EL002", "{0} 인력원장 데이터 수정 중 오류가 발생했습니다."),
	EL003("EL003", "{0} 인력원장 데이터 삭제 중 오류가 발생했습니다."),
	EL004("EL004", "{0} 인력원장 데이터 조회 중 오류가 발생했습니다."),
	SL001("SL001", "{0} 매출원장 데이터 등록 중 오류가 발생했습니다."),
	SL002("SL002", "{0} 매출원장 데이터 수정 중 오류가 발생했습니다."),
	SL003("SL003", "{0} 매출원장 데이터 삭제 중 오류가 발생했습니다."),
	SL004("SL004", "{0} 매출원장 데이터 조회 중 오류가 발생했습니다."),
	EC001("EC001", "{0} 엑셀 데이터 추가가 실패하였습니다."),
	EC002("EC002", "{0} 엑셀 데이터 추가가 실패하였습니다.\\n\\n에러원인: {1}"),
	EC003("EC003", "{0} 엑셀 데이터 추가가 실패하였습니다.\\n\\n에러원인: {1}\\n\\n추적: {2}"),
	BC001("BC001", "{0} 배치 실행중 오류가 발생했습니다."),
	MB001("MB001", "{0} 회원정보 등록 중 오류가 발생했습니다."),
	MB002("MB002", "{0} 회원정보 수정 중 오류가 발생했습니다."),
	MB003("MB003", "{0} 회원정보 삭제 중 오류가 발생했습니다."),
	MB004("MB004", "{0} 회원정보 조회 중 오류가 발생했습니다."),
	AP001("AP001", "{0} API 요청 중 오류가 발생했습니다."),
	;
	
	private final String errorCode;
	private final String errorMessage;
	
	CustomExceptionCode(String errorCode, String errorMessage) {
		this.errorCode = errorCode;
		this.errorMessage = errorMessage;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public String getErrorMessage() {
		return errorMessage;
	}
	
	
}
