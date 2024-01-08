package com.example.boot08.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

/*
 * 	-Aspectj Expression
 * 
 * 	1. execution(* *(..)) => 접근 가능한 모든 메소드가 
 * 	   point cut
 * 	2. execution(* test.service.*.*(..)) 
 * 		=> test.service 패키지의 모든 메소드 point cut
 * 	3. execution(void insert*(..))
 * 		=>리턴 type 은 void 이고 메소드명이 
 * 		insert 로 시작하는 모든 메소드가 point cut
 * 	4. execution(* delete*(*))
 * 		=> 메소드 명이 delete 로 시작하고 인자로 1개 전달받는 
 *      메소드가 point cut (aop 가 적용되는 위치)
 * 	5. execution(* delete*(*,*))
 * 		=> 메소드 명이 delete 로 시작하고 인자로 2개 전달받는 
 *      메소드가 point cut (aop 가 적용되는 위치)
 *  6. execution(String update*(Integer,*))
 *      => 메소드 명이 update 로 시작하고 리턴 type 은 String
 *      메소드의 첫번째 인자는 Integer type, 두번째 인자는 아무 type 다되는 
 *      메소드가 point cut (aop 가 적용되는 위치)
 */



@Aspect
@Component
public class MessengerAspect {
	
	@Around("execution(void send*(..))")
	public void checkGreeting(ProceedingJoinPoint joinPoint) throws Throwable {
		//메소드에 전달된 인자들 목록을 얻어내기
		Object[] args=joinPoint.getArgs();
		//반복문 돌면서 매개변수에 담긴 값들을 하나하나 조사해 볼수 있다.
		for(Object tmp:args) {
			//원하는 type 을 찾는다
			if(tmp instanceof String) { //만일 찾는 type(String) 이면 
				String msg=(String)tmp; //원래 type 으로 casting 해서 작업한다
				System.out.println("aspect 에서 읽어낸 내용:"+msg);
				
				if(msg.contains("똥깨")) {
					System.out.println("똥깨는 금지된 단어 입니다.");
					return; // 메소드를 여기서 끝내기
				}
			}
		}
		//aspect 가 적용된 메소드가 호출 되기 직전에 할 작업은 proceed() 호출전에 한다.
		
		//이 메소드를 호출하는 시점에 실제로 aspect 가 적용된 메소드가 수행된다. (호출하지 않으면 수행안됨)
		joinPoint.proceed();
		
		//aspect 가 적용된 메소드가 리턴된 이후에 할 작업은 proceed() 호출 이후에 한다.
		System.out.println("aspect 가 적용된 메소드가 리턴 했습니다.");
	}
	
	/*
	 *  return type 은 String 이고
	 *  get 으로 시작은 메소드 이고
	 *  메소드에 전달되는 인자는 없다 
	 *  java.lang 페키지에 있는 type 은 페키지명 생략 가능
	 *  com.example.boot08.util 페키지에 존재하는 모든 클래스의 메소드 중에서 get 으로 시작하는 메소드
	 */
	@Around("execution(String com.example.boot08.util.*.get*())")
	public Object checkReturn(ProceedingJoinPoint joinPoint) throws Throwable {

		// aspect 가 적용된 메소드를 수행하고 리턴되는 데이터 받아오기 
		Object obj=joinPoint.proceed();
		
		//원래 type 으로 casting 해서 조사해 볼수가 있다.
		String a = (String)obj;

		//조사후 아예 다른 값을 리턴해 줄수도 있다. 
		return obj;
		//return "놀자놀자";
	}	
		
}