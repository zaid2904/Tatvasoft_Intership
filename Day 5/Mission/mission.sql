select * from public."User"
order by id asc;
INSERT INTO public."User"(
    id, first_name, last_name, email_address, password, phone_number, user_type, user_image, "CreatedDate", "ModifiedDate", "IsDeleted"
)
VALUES (
    2, 'Rakesh', 'Choudhary', 'rakesh@gmail.com', 'pass123', '1234567890', 'user', 'default.png', NOW(), NOW(), FALSE
);
select * from user




