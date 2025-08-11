# KD손해보험 관리자 백엔드 프로젝트
Java + Spring Legacy + Oracle 기반의 보험사 관리자 페이지

---

## #0. 프로젝트 개요
**프로젝트 이름**: 보험사 보험 업무 자동화 (KD손해보험 관리자 시스템)

**프로젝트 목적 및 개요**:  
KD손해보험의 보험 업무 진행을 위한 **관리자 페이지를 구현하는 사이트** 구축. 관리자가 효율적으로 고객, 상품, 계약 등의 데이터를 관리하고, 전반적인 보험 업무 프로세스를 자동화 및 간소화하는 데 기여함을 목표로 함.  
스프링 레거시(Spring Legacy) 기반으로 안정적인 시스템을 구축하고, 사용자 친화적인 인터페이스를 제공하여 관리자 업무 생산성을 향상시킴.

**프로젝트 기간**: 전체 기간: 2025.07.08 ~ 2025.08.11

**기술 스택**:
- **프론트엔드**: HTML, CSS, JavaScript, Bootstrap, JQuery
- **백엔드**: Spring, Java

---

## #1. 설명
### 시스템 아키텍처
프로젝트의 아키텍처는 다음과 같이 구성됩니다:
- **클라이언트**: HTML, CSS, JavaScript 등으로 사용자 인터페이스 제공
- **웹 서버**: Apache Tomcat (정적 콘텐츠 처리, 요청 포워딩)
- **WAS**: Spring Framework 기반의 Java 애플리케이션
- **DB**: Oracle DB를 통해 데이터 관리 및 연동

<img src="https://github.com/user-attachments/assets/4473b1d2-2f72-4336-ba9f-422d00708de0" width="800" height="600" />
<img src="https://github.com/user-attachments/assets/c85c149c-dd1d-4115-82b8-cc52547255b3" width="800" height="600" />

---

## #2. 요구 사항 분석
- **로그인 기능**: 관리자 로그인을 하지 않으면 메인화면 이동 불가. 로그인된 사용자만 고객/피보험자/계약/공지사항 CRUD 허용.
- **고객 관리**: 고객 등록 시 필수 항목: 고객 ID, 비밀번호, 고객 이름, 생년월일, 성별, 연락처. 
  - 고객 정보 수정은 고객 ID, 생년월일, 성별, 권한, 등록일 제외 수정 가능.
  - 피보험자 미등록 시 고객 삭제 처리 가능.
- **피보험자 관리**: 피보험자 등록 시 필수 항목: ID, 이름, 생년월일, 성별.
- **계약 관리**: 계약 번호는 자동 등록, 계약 시작일 필수 입력.
- **공지사항 관리**: 공지사항 제목, 내용 필수 입력. 중요 공지 여부 설정 가능.

---

## #3. 워크플로우 영상
각 기능별 워크플로우 영상은 아래와 같습니다. 각 링크를 클릭하여 해당 기능의 실행 과정을 확인할 수 있습니다.

### 1. 로그인
로그인 화면을 통해 사용자 인증을 처리하는 과정입니다.  
<a href="https://github.com/user-attachments/assets/로그인-영상-url">
  로그인 영상
</a>

### 2. 고객 관리
고객 목록 조회, 고객 등록, 수정, 삭제 기능을 보여주는 영상입니다.  
<a href="https://github.com/user-attachments/assets/고객-관리-영상-url">
  고객 관리 영상
</a>

### 3. 피보험자 관리
피보험자 목록 조회, 등록, 수정, 삭제 과정입니다.  
<a href="https://github.com/user-attachments/assets/피보험자-관리-영상-url">
  피보험자 관리 영상
</a>

### 4. 계약 관리
계약 리스트 조회, 계약 등록, 수정, 삭제 과정입니다.  
<a href="https://github.com/user-attachments/assets/계약-관리-영상-url">
  계약 관리 영상
</a>

### 5. 공지사항 관리
공지사항 목록 조회, 등록, 수정, 삭제 및 댓글 관리 기능입니다.  
<a href="https://github.com/user-attachments/assets/공지사항-관리-영상-url">
  공지사항 관리 영상
</a>

---

## 📄 데이터베이스 설계 (ERD)
![ERD](https://github.com/user-attachments/assets/0f1a88da-d62d-468b-befd-a6b009c5152c)

---

**📑 전체 상세 문서**: [docs/KD손해보험_프로젝트_설명서.pdf](docs/KD손해보험_프로젝트_설명서.pdf)
