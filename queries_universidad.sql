use universidad;
-- select apellido1, apellido2, nombre from persona where tipo = 'alumno' order by apellido1;
-- select nombre, apellido1, apellido2 from persona where tipo = 'alumno' and telefono is null;
-- select * from persona where tipo = 'alumno' and fecha_nacimiento between '1999-01-01' and '1999-12-31';
-- select * from persona where tipo = 'profesor' and telefono is null and nif like '%k';
-- select a.id as 'asignatura_id', a.nombre as 'asignatura', a.cuatrimestre, ce.anyo_inicio, ce.anyo_fin, g.nombre as 'grado' from asignatura a join grado g  on a.id_grado = g.id join curso_escolar ce on ce.id = a.curso where a.cuatrimestre = 1 and g.id = 7;
-- select p.apellido1, p.apellido2, p.nombre, d.nombre as 'departamento' from persona p join profesor pro on p.id = pro.id_profesor join departamento d on d.id = pro.id_departamento order by apellido1;
-- select a.nombre as 'asignatura', ce.anyo_inicio, ce.anyo_fin from persona p join alumno_se_matricula_asignatura asma on p.id = asma.id_alumno join asignatura a on a.id = asma.id_asignatura join curso_escolar ce on ce.id = a.curso where p.nif = '26902806M';
-- select d.nombre as 'departamento', pro.id_profesor, a.nombre as 'asignatura', g.nombre from departamento d join profesor pro on d.id = pro.id_departamento join asignatura a on a.id_profesor = pro.id_profesor join grado g on a.id_grado = g.id where g.nombre = 'Grado en Ingeniería Informática (Plan 2015)' order by pro.id_profesor;
-- select distinctrow p.id, p.apellido1, p.nombre, a.nombre as 'asignatura', ce.anyo_inicio, ce.anyo_fin from persona p join alumno_se_matricula_asignatura asma on asma.id_alumno = p.id join curso_escolar ce on ce.id = asma.id_curso_escolar join asignatura a on a.curso = ce.id where ce.id = 1 order by p.id;

-- consultas con left y right join
-- select p.apellido1, p.apellido2, p.nombre, d.nombre as 'departamento'from persona p left join profesor pro on p.id = pro.id_profesor left join departamento d on d.id = pro.id_departamento where p.tipo = 'profesor' order by departamento, apellido1;
-- select p.id, p.apellido1, p.nombre, d.nombre as 'departamento' from departamento d right join profesor pro on pro.id_departamento = d.id right join persona p on p.id = pro.id_profesor where p.tipo = 'profesor' and d.nombre is null;
-- select d.nombre as 'departamento', pro.id_profesor from profesor pro right join departamento d on d.id = pro.id_departamento where pro.id_profesor is null;
-- select p.apellido1, p.nombre, pro.id_profesor, a.nombre as 'asignatura' from persona p left join profesor pro on p.id = pro.id_profesor left join asignatura a on a.id_profesor = pro.id_profesor where p.tipo = 'profesor' and a.nombre is null;
-- select a.nombre as 'asignatura', pro.id_profesor from asignatura a left join profesor pro on pro.id_profesor = a.id_profesor where a.id_profesor is null;
-- select d.id, d.nombre as 'departamento', a.nombre as 'asignatura', ce.id as 'curso_escolar' from departamento d left join profesor pro on d.id = pro.id_departamento left join asignatura a on a.id_profesor = pro.id_profesor left join curso_escolar ce on ce.id = a.curso where a.nombre is null and ce.id is null;

-- queries resumen
-- select count(id) as 'total_alumnos' from persona  where tipo = 'alumno';
-- select count(id) as 'total_alumnos_1999' from persona where tipo = 'alumno' and fecha_nacimiento between '1999-01-01' and '1999-12-31';
-- select count(pro.id_profesor) as 'cantidad_profesores', d.nombre as 'departamento' from departamento d join profesor pro on d.id = pro.id_departamento group by d.nombre order by count(pro.id_profesor);
-- select count(pro.id_profesor) as 'cant_prof', d.nombre as 'departamento' from departamento d left join profesor pro on d.id = pro.id_departamento group by d.nombre order by count(pro.id_profesor);
-- select count(a.id) as 'cantidad_asignatura', g.nombre as 'grado' from grado g left join asignatura a on a.id_grado = g.id group by g.nombre order by count(a.id);
-- select count(a.id) as 'cant_asig', g.nombre as 'grado' from grado g left join asignatura a on a.id_grado = g.id group by g.nombre having count(a.id) >= 40 order by count(a.id);
-- select g.nombre as 'grado', a.tipo as 'asig_tipo', sum(a.creditos) as 'sum_creditos' from grado g join asignatura a on g.id = a.id_grado group by g.nombre, a.tipo;
-- select count(asma.id_alumno) as 'cantidad_alumnos', ce.anyo_inicio from curso_escolar ce join alumno_se_matricula_asignatura asma on ce.id = asma.id_curso_escolar group by ce.anyo_inicio
-- select pro.id_profesor, p.nombre, p.apellido1, p.apellido2, count(a.id) as 'cant_asignaturas' from persona p left join profesor pro on p.id = pro.id_profesor left join asignatura a on pro.id_profesor = a.id_profesor where p.tipo = 'profesor' group by pro.id_profesor;
-- select * from persona where tipo = 'alumno' group by fecha_nacimiento order by max(fecha_nacimiento) desc limit 1;
-- select pro.id_profesor, p.apellido1, p.nombre, d.nombre as 'departamento', a.nombre as 'asignatura' from persona p left join profesor pro on p.id = pro.id_profesor left join departamento d on pro.id_departamento = d.id left join asignatura a on pro.id_profesor = a.id_profesor where p.tipo = 'profesor' and a.id_profesor is null


