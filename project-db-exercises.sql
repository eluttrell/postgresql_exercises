-- 1. Do a cartesian join between the project table and the tech table
select * from project, tech;
-- 2. Perform a left outer join between the project table and the project_uses_tech tables
select * from project left outer join project_uses_tech on project_uses_tech.project_id = project.id;
-- 3. Perform a left outer join between the tech table and the project_uses_tech table
select * from tech left outer join project_uses_tech on project_uses_tech.tech_id = tech.id;
-- 4. Perform a left outer join from the project table to the project_users_tech table and then left outer join again to the tech table.
select * from project left outer join project_uses_tech on project_uses_tech.project_id = project.id;
select * from project left outer join tech on project.id = tech.id;
-- 5. Start from the answer on the previous problem and get the count of how many different tech each project uses
select count(tech) from project, tech where project.id = tech.id group by tech.name;
-- 6. For each tech, get the count of how many projects use it

-- 7. Order the projects by how many tech it uses

-- 8. Order the tech by how many projects use it

-- 9. What is the average number of techs used by a project?
