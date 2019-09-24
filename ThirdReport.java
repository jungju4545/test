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
	
	
	//���� ��� �޼���
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
		bt1 = new JButton("���������ư");
		bt1.addActionListener(this);
        add(bt1);
		setVisible(true);

	 }
// ���� ���� �ƹ� wav���� �޾Ƽ� ������Ѻ���
	@Override
	public void actionPerformed(ActionEvent e) {
		 if(e.getActionCommand().equals("���������ư")){  
		     Play("sound/bird.wav");   //������� �޼��� ȣ��. �Ķ���ͷ� ������ ��ġ�� �̸��� ����� �Ѵ�.
		  }
		
	}
	

	public static void main(String[] args){
		new ThirdReport();
	}

}
