# KD손해보험 관리자 백엔드 프로젝트
Java + Spring Legacy + Oracle 기반의 보험사 관리자 페이지

---

## 📌 프로젝트 개요
- **목적**: KD손해보험의 고객, 피보험자, 계약, 공지사항 등 보험 업무를 효율적으로 관리할 수 있는 관리자 시스템 구축
- **특징**
  - Spring Legacy + MyBatis 기반 CRUD
  - Oracle DB 연동 및 HikariCP 커넥션 풀 사용
  - Spring Security 기반 인증/권한 관리
  - JSP + Bootstrap 기반 관리자 UI
  - Ajax를 활용한 실시간 데이터 처리

---

## 🏗 시스템 아키텍처
<img src="https://github.com/user-attachments/assets/4473b1d2-2f72-4336-ba9f-422d00708de0" width="900" />
<img src="https://github.com/user-attachments/assets/c85c149c-dd1d-4115-82b8-cc52547255b3" width="900" />

---

## 🛠 기술 스택
| 구분 | 기술 |
|------|------|
| 프레임워크 | Spring Framework (Legacy) |
| ORM | MyBatis |
| DB | Oracle |
| 보안 | Spring Security |
| 빌드 | Maven |
| 서버 | Apache Tomcat |
| 프론트 | JSP, JSTL, Bootstrap, jQuery |

---

## 📂 주요 기능
- **대시보드**
  - 월별 계약 현황, 상품별 계약 비율, 고객·피보험자·계약·공지사항 건수 그래프
  - 최근 등록 계약·공지사항 목록
- **고객 관리**
  - 등록 / 조회 / 수정 / 삭제
  - 연결된 피보험자 관리
- **피보험자 관리**
  - 고객 연동, 계약 연계
- **계약 관리**
  - 상품명, 기간, 상태 변경 가능
- **공지사항 관리**
  - 등록 / 수정 / 삭제
  - 댓글 CRUD 지원
- **관리자 설정**
  - 비밀번호 변경, 접근 기기 관리, 근무 정책, 약관 관리 등

---

## 📄 데이터베이스 설계 (ERD)
![ERD](https://github.com/user-attachments/assets/0f1a88da-d62d-468b-befd-a6b009c5152c)

---

**📑 전체 상세 문서**: [docs/KD손해보험_프로젝트_설명서.pdf](docs/KD손해보험_프로젝트_설명서.pdf)
