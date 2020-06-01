team(['40138194', '40129421', '40135464']).
student_info('40138194', 'Marita', 'Brichan').
student_info('40129421', 'Mohona', 'Mazumdar').
student_info('40135464', 'Jasmine', 'Lebel').
takes_course('40138194', 'comp', '348', 'ab').
takes_course('40138194', 'comp', '348', 'abae').
takes_course('40138194', 'comp', '352', 'aa').
takes_course('40138194', 'comp', '352', 'aaaf').
takes_course('40138194', 'engr', '202', 'aa').
takes_course('40129421', 'comp', '348', 'ab').
takes_course('40129421', 'comp', '348', 'abae').
takes_course('40129421', 'comp', '352', 'aa').
takes_course('40129421', 'comp', '352', 'aaaf').
takes_course('40129421', 'engr', '202', 'aa').
takes_course('40135464', 'comp', '348', 'ab').
takes_course('40135464', 'comp', '348', 'abae').
takes_course('40135464', 'engr', '213', 'aa').
takes_course('40135464', 'engr', '213', 'aaag').
takes_course('40135464', 'engr', '202', 'ab').
course_schedule('comp', '352', 'aa', 'mon', '1830', '2100').
course_schedule('comp', '352', 'aa', 'wed', '1830', '2100').
course_schedule('comp', '352', 'aaaf', 'mon', '1215', '1305').
course_schedule('comp', '352', 'aaaf', 'wed', '1215', '1305').
course_schedule('comp', '348', 'ab', 'tue', '1315', '1545').
course_schedule('comp', '348', 'ab', 'thu', '1315', '1545').
course_schedule('comp', '348', 'abae', 'tue', '1615', '1705').
course_schedule('comp', '348', 'abae', 'thu', '1615', '1705').
course_schedule('engr', '202', 'aa', 'mon', '1145', '1300').
course_schedule('engr', '202', 'aa', 'tue', '1145', '1300').
course_schedule('engr', '202', 'ab', 'fri', '1015', '1300').
course_schedule('engr', '213', 'aa', 'tue', '1015', '1245').
course_schedule('engr', '213', 'aa', 'thu', '1015', '1245').
course_schedule('engr', '213', 'aaag', 'tue', '0830', '1010').
course_schedule('engr', '213', 'aaag', 'thu', '0830', '1010').

all_sections(CNAM,CNUM,L):- findall(C,course_schedule(CNAM,CNUM,C,_,_,_),X), sort(X,L).
/* L contains a list of all sections of course CNAME, CNUM,
i.e. calling all_sections('comp', '348', L) will result in L=['aa', 'ab'];
     no duplicates */

has_taken(S, [CNAM|[CNUM|[SEC|[]]]]):- takes_course(S,CNAM,CNUM,SEC).
/* true if student S takes the course CNAM CNUM SEC,
   e.g. takes('4000123', ['comp', '348', 'aa']) */
	
has_taken2(S, [CNAM|[CNUM|[]]]) :- takes_course(S,CNAM,CNUM,_).
/* true if S takes any sections of the course CNAM CNUM,
   e.g. takes('4000123', ['comp', '348']) */
	
all_subjects(S,L):- findall(C,takes_course(S,C,_,_),X), sort(X,L).
/* L contains all the courses subjects that have been
taken by student S, i.e. ['comp', 'soen']; no duplicates */

all_courses(S,L):- findall([M,N,O],takes_course(S,M,N,O),L).
/* L contains all the courses that have been taken by
   student S, i.e. all_courses('4000123', L) will result in
   L=[['comp', '348', 'aa'], ['comp', '348', 'ab']] */

all_courses2(S,L):- findall([M,N],takes_course(S,M,N,_),X), sort(X,L).
/* similar to all_courses but without section info;
   no duplicates */

/* count all the courses for each student:
 team(X), member(S, X),
      findall(S, takes_course(S, _, _, _), LL),
      length(LL, NN),
      write(S), write(' has only taken '), write(NN),
      write(' courses and tutorials in summer 2020.'), nl, fail. */

/* count all the courses without the sections for each student:
team(X), member(S, X),
all_courses2(S,LL),
length(LL, NN),
write(S), write(' has only taken '), write(NN),
write(' courses and tutorials in summer 2020.'), nl, fail. */