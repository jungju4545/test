package sound;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;

import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.Clip;
import javax.swing.JButton;
import javax.swing.JFrame;

public class ThirdReport extends  JFrame
implements ActionListener{
	
	private JButton bt1;
	
	
	//음악 재생 메서드
    public void Play(String fileName)
    {
        try
        {
            AudioInputStream ais = AudioSystem.getAudioInputStream(new File(fileName));
            Clip clip = AudioSystem.getClip();
            clip.stop();
            clip.open(ais);
            clip.start();
        }
        catch (Exception ex)
        {
        }
    }
	public ThirdReport() {
		setSize(300,300);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		bt1 = new JButton("음악재생버튼");
		bt1.addActionListener(this);
        add(bt1);
		setVisible(true);

	 }
// 집에 가서 아무 wav파일 받아서 실행시켜보기
	@Override
	public void actionPerformed(ActionEvent e) {
		 if(e.getActionCommand().equals("음악재생버튼")){  
		     Play("sound/bird.wav");   //음악재생 메서드 호출. 파라미터로 파일의 위치와 이름을 써줘야 한다.
		  }
		
	}
	

	public static void main(String[] args){
		new ThirdReport();
	}

}
