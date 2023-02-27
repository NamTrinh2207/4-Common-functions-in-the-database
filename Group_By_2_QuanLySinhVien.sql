use QuanLySinhVien;
# Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select SubId, SubName, Credit, Status, MAX(Credit)
from subject
group by  SubId, SubName, Credit, Status;
# Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.SubId, s.SubName, max(Mark) as "Điểm cao nhất" from subject s, mark m
where s.SubId = m.SubId
group by s.SubId, s.SubName
having max(Mark) >= all(select max(Mark)
						   from subject s, mark m
                           where s.SubId = m.SubId
						   group by s.SubId, s.SubName);
# Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select StudentName,  mark from (student s join mark m on s.StudentId = m.StudentId)
order by mark desc;