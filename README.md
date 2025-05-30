# JobConnect_AutomationTest
# 🔎 Dự án Kiểm Thử Tự Động JobConnect

## 🧠 Mục đích

Dự án này được xây dựng nhằm thực hành **kiểm thử phần mềm** bao gồm cả **kiểm thử thủ công** và **kiểm thử tự động**, dựa trên một **trang web tuyển dụng JobConnect** do tôi **tự phát triển** bằng **ASP.NET Core MVC**. Mục tiêu là mô phỏng quy trình kiểm thử thực tế tại doanh nghiệp và áp dụng các kỹ thuật hiện đại như **Page Object Model (POM)**, kiểm thử dữ liệu từ **Excel**, và sử dụng **Selenium + NUnit**.

---

## 🛠️ Công nghệ & Công cụ

| Công nghệ / Công cụ         | Mô tả                                      |
|-----------------------------|--------------------------------------------|
| **ASP.NET Core MVC**        | Xây dựng trang web JobConnect              |
| **C# + Selenium WebDriver** | Kiểm thử tự động giao diện người dùng (UI) |
| **NUnit**                   | Framework viết & quản lý test scripts      |
| **ExcelDataReader**         | Đọc/Ghi dữ liệu kiểm thử từ file Excel     |
| **Mẫu thiết kế POM**        | Quản lý mã nguồn kiểm thử hiệu quả         |
| **Visual Studio**           | IDE phát triển & chạy test                 |

---

## 🧪 Chức năng đã kiểm thử

### ✅ Thủ công (Manual Testing)

- Đăng ký tài khoản
- Đăng nhập
- Tìm kiếm công việc
- Đăng tin tuyển dụng
- Quản lý tin tuyển dụng
- Quản lý ứng viên
- Duyệt tin (vai trò Admin)
- Quản lý công ty
- Quản lý nhà tuyển dụng
- Nộp đơn ứng tuyển
- Quản lý đơn ứng tuyển cá nhân
- Quản lý hồ sơ cá nhân
- Đăng xuất

### ✅ Tự động (Automation Testing - Selenium + NUnit)

| Tên chức năng          | Đã kiểm thử | Dữ liệu từ Excel |
|------------------------|-------------|------------------|
| Đăng ký                | ✔️          | ✔️              |
| Đăng nhập              | ✔️          | ✔️              |
| Tìm kiếm công việc     | ✔️          | ✔️              |
| Đăng tin tuyển dụng    | ✔️          | ✔️              |
| Duyệt tin tuyển dụng   | ✔️          | ✔️              |
| Nộp đơn ứng tuyển      | ✔️          | ✔️              |

## 📂 Cấu trúc thư mục

```bash
JobConnect-AutomationTest/
│
├── JobConnect-Selenium/ # Dự án Selenium chính
│ ├── Pages/ # Các trang được mô hình hóa theo POM
│ └── Tests/ # Các kịch bản test tự động
│
├── TestData/ # Dữ liệu kiểm thử dạng Excel
│ ├── ApplyJob.xlsx
│ ├── Login.xlsx
│ ├── PostJob.xlsx
│ ├── Register.xlsx
│ └── SearchJob.xlsx
│
├── TestCases/ # Các test case thủ công và tự động
│ ├── JobConnect_AutomationTestCases.xlsx
│ └── JobConnect_ManualTestCases.xlsx
│
├── jobconnect/ # Source dự án JobConnect (backend)
│ ├── jobconnect.sln
│ └── recruit.sql # Cơ sở dữ liệu
│
└── README.md # File mô tả dự án
