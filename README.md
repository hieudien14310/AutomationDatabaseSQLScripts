Dùng để quản lý các câu lệnh SQL của **PostgreSQL** theo thứ tự và tự động chạy câu lệnh đó mỗi khi được merge vào nhánh **deploy-sql**.

**Chỉ hỗ trợ cho 1 connection cho 1 repository, nếu muốn dùng cho connection khác thì nên fork ra rồi thay đổi SECRET DATABASE_URL**

## Quan trọng cần lưu ý

Hiện tại không có hỗ trợ revert lại sau khi đã chạy lệnh SQL. Bạn phải tạo file sql mới rồi deploy lại.

Nếu bạn update câu lệnh SQL sai thì cứ tạo tiếp sql mới để sửa lại cái sai đó.

## Cú pháp để kết nối tới postgresql server của bạn

```
psql -h <host_name> -p <PORT> -U <tên_user>
```

Ví dụ, nếu user là postgres và database là mydb

```
psql -h localhost -p 5432 -U postgres -d mydb
```

## Giá trị trong Secret DATABASE_URL

Vào repository >> setting >> Secrets and variables >> Tạo 1 key tên là **DATABASE_URL**

Lưu ý: DATABASE_URL không nên chứa tên database ở cuối, chỉ cần kết thúc bằng dấu `/`.

```
postgresql://postgres:123456789!@#ZXC@postgres.abcxyz.click:5432/
```

## Cấu trúc thư mục

```
| scripts - Thư mục để chạy các SQL ứng với từng DB
|-tên database 1 - Tên folder ứng với tên database của bạn
|--001-filname.sql - Nên đặt tên file sql có prefix phía trước là STT + mục đích
|--002-filname.sql
|--003-filname.sql
|-tên database 2
|--...
|-tên database 3
|--...
```

## Cách setup để hoạt động được

- Bạn phải tạo database trước rồi mới tạo folder cùng tên (trong thư mục scripts)
- Tạo nhánh tên là deploy-sql. Bạn có thể sự đổi lại tên trong phần deploy-sql.yml
