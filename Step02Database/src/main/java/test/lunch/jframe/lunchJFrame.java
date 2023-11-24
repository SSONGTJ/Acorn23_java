package test.lunch.jframe;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Random;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class lunchJFrame {
	
    public static void main(String[] args) {
    	JFrame frame = new JFrame("Lunch Menu Selector");
        frame.setSize(400, 300);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JLabel label = new JLabel("점심 뭐먹지?");
        frame.add(label);

        // 점심 메뉴 배열
        String[] lunchMenu = {"삼원명가", "청목", "우육면", "짜장면", "분식", "은희네해장국", "돈까쓰", "콩나물국밥"};

        // 버튼 생성
        JButton button = new JButton("골라보자!");

        // 버튼에 이벤트 리스너 추가
        button.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // 랜덤으로 메뉴 선택
                String selectedMenu = getRandomMenu(lunchMenu);
                label.setText(selectedMenu);
            }
        });

        // 버튼을 JFrame에 추가
        frame.add(button);

        frame.setLayout(new java.awt.FlowLayout());
        frame.setVisible(true);
    }

    // 배열에서 랜덤으로 하나의 요소 선택
    private static String getRandomMenu(String[] menuArray) {
        Random random = new Random();
        int randomIndex = random.nextInt(menuArray.length);
        return menuArray[randomIndex];
    }
}
