//메모
class Memos {
  String Mtitle;
  String contents;
  Memos(this.Mtitle, this.contents);
}

// 문제 클래스
class Problem_p {
  int page; // 장
  int number; // 문제 번호
  String title; // 제목
  String contents; // 내용
  String hint; // 힌트

  // 문제 목록
  //Problem(몇장, 몇번문제, 문제제목, 내용, 힌트;
  static List<Problem_p> problems = [
    Problem_p(1, 1,
        'printf 문\n1-1\n<"Hello World의 출력">',
        '#include <stdio.h>\n'
            'void main(){\n'
            'printf("hello world\￦n"); //hello world를 출력한다.\n}',
        '출력하기 위해서는 printf("");를 사용해야 한다.'),
    Problem_p(1, 2,
        'scanf 문\n1-2\n<"키보드로부터 입력받기">',
        '#include <stdio.h>\n'
            'void main(){\n'
            'int a; //변수 a를 정수형으로 선언한다.\n\n'
            'scanf("%d", &a); //정수형 a에 들어갈 값을 키보드로 입력한다.\n\n'
            'printf("%d %d\￦n", a, a); //%d에 정수형 a값을 대입 후 출력한다.\n}',
        '정수를 입력할 때에는 %d, 실수는 %f, 문자는 %c를 사용한다.\n'
            '프로그램을 실행하면 정수값을 입력 후 enter키를 누르면 입력한 정수값이 a에 대입된다.\n'),
    Problem_p(1, 3,
        '에스케이프 시퀀스\n1-3\n<"에스케이프 시퀀스를 사용하여 문자열 출력">',
        '#include <stdio.h>\n'
            'void main(){\n'
            'printf("Apple "); //Apple을 출력한다.\n'
            'printf("Banana "); //Banana를 출력한다.\n'
            'printf("Cherry\￦n"); //Cherry를 출력한 후 행을 바꾼다.\n'
            'printf("Dragonfruit\￦tEggfruit\￦n"); //Dragonfruit를 출력하고, 탭(칸 띄우기) 후 Eggfruit를 출력한다.\n}',
        '에스케이프 시퀀스는 다음과 같은 것들이 있다.\n'
            '널 문자 \￦0            폼피드 \￦f\n'
            '벨 문자 \￦a            캐리지 리턴\￦r\n'
            '백스페이스 \￦b       이중 인용부호 \￦"\n'
            '탭 \￦t                   단일 인용부호\￦\'\n'
            '행 바꾸기 \￦n         역슬래시 \￦￦'),
    Problem_p(1, 4,
        '주석\n1-4\n<"주석의 사용">',
        '#include <stdio.h>\n'
            'void main(){\n'
            '/*\nprintf("hello world\￦n");\n-> hello world를 출력한다.\n*/\n'
            '//주석에 대해서 배우는 중입니다.\n'
            'printf("hello world\￦n");\n}',
        '주석은 /*와 */ 사이, 또는 // 다음에 표시한 임의의 문자열이며, 여백으로 간주된다.\n'
            '주석을 사용하면 프로그램의 작성과 독해력을 증가시키는 효과가 있다.'),
    Problem_p(1, 5,
        '예약어\n1-5\n<"예약어를 사용한 덧셈">',
        '#include <stdio.h>\n'
            'void main(){\n'
            'int x; //정수형 x를 선언한다.\n'
            'int y; //정수형 y를 선언한다.\n\n'
            'x = 3; //정수형 x에 3을 대입한다.\n'
            'y = 5; //정수형 y에 5를 대입한다.\n\n'
            'printf("x = %d\￦n", x + y); //x + y를 한 값을 출력한다.\n}',
        '예약어는 다음과 같다.\n'
            '  auto           break          case          char       continue      default\n'
            '   do            double         else          enum        exterm         float\n'
            '   for             goto             if              int             log          register\n'
            ' return          short         sizeof        static        struct        switch\n'
            'typedef        union       unsigned       void          while        signed\n'),
    Problem_p(1, 6,
        '문장\n1-6\n<"if문을 사용한 문장">',
        '#include <stdio.h>\n'
            'void main(){\n'
            'int n; //정수형 n을 선언한다.\n\n'
            'scanf("%d", &n); //키보드로 입력을 받는다.\n\n'
            'if(n % 2 == 0){ //만약 키보드로 입력받은 정수를 2로 나눴을 때 나머지가 0이면\n'
            'printf("%d는 짝수입니다.\￦n", n); //입력받은 수는 짝수입니다.를 출력한다.\n'
            '} else //그렇지 않다면(if문이 아니라면)\n'
            'printf("%d는 홀수입니다.\￦n", n); //입력받은 수는 홀수입니다.를 출력한다.\n}',
        'if()는 만약 ~~한다면\n'
            'printf(""); 출력해라.\n'
            'else는 그렇지 않다면\n'
            'printf(""); 출력해라.'),
    Problem_p(2, 1,
        'printf 문\n1-1\n<"Hello World의 출력">',
        '#include <stdio.h>\n'
            'void main(){\n'
            'printf("hello world\￦n"); //hello world를 출력한다.\n}',
        '출력하기 위해서는 printf("");를 사용해야 한다.'),
  ];

// 페이지와 문제 번호에 해당하는 문제 반환
  static Problem_p get(int a, int b) {
    for (Problem_p p in problems) {
      if (a == p.page && b == p.number) {
        return p;
      }
    }
    return dummy; // 문제가 없는 경우 더미 반환
  }

  // 더미 문제
  static Problem_p dummy = Problem_p(
    0,
    0,
    'dummy title',
    'contents',
    'hint',
  );

  // Problem_p 클래스 생성자
  Problem_p(this.page, this.number, this.title, this.contents, this.hint);
}


//시험
class Problem_t {
  int page;
  int number;
  String title;
  String testCase;
  String rtestCase2;
  String contents;
  String myAnswer;
  String hint;
  String answer;

  //Problem(몇장, 몇번문제, 문제제목, 소제목, 내용1, 입력받는 정답 ,내용2, 힌트, 정답);
  static List<Problem_t> problems = [
    Problem_t(1, 1,
        '1-1\n<"Hi C programing">\n을 출력하세요.',
        '10\n20\n30\n40\n50\n60',
        'Hi C programing',
        '#include <stdio.h>\n'
            'int main(){\n'
            '//안에 들어갈 내용을 적으세요.\n}',
        '',
        'hint',
        'answer'),
  ];

  static Problem_t get(int a, int b) {
    for (Problem_t p in problems) {
      if (a == p.page && b == p.number) {
        return p;
      }
    }
    return dummy;
  }

  static Problem_t dummy = Problem_t(0, 0, 'dummy title', 'dummy testcase','dummy rtestcase',
      'contents', 'dummy', 'hint', 'answer');

  Problem_t(this.page, this.number, this.title, this.testCase, this.rtestCase2, this.contents,
      this.myAnswer, this.hint, this.answer);
}