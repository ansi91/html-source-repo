package project.restaurant;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class RestINSView extends JDialog implements ActionListener {
	JLabel 	 			jlb_name = new JLabel("식당명");
	JTextField 		jtf_name = new JTextField(30);
	JLabel 	 			jlb_tel = new JLabel("전화번호");
	JTextField 		jtf_tel = new JTextField(20);
	JLabel 				jlb_addr = new JLabel("주소");
	JTextField 		jtf_addr = new JTextField(60);
	JLabel 	 			jlb_photo = new JLabel("사진");
	JTextField 		jtf_photo = new JTextField(60);
	JLabel 				jlb_info = new JLabel("식당 정보");
	JTextArea 		jta_info = new JTextArea(8,25);
	JScrollPane		jsp_info = new JScrollPane(jta_info);
	JLabel 	 			jlb_time = new JLabel("여닫는 시간");
	JTextField 		jtf_time = new JTextField(60);
	JLabel 	 			jlb_lat = new JLabel("위도");
	JTextField 		jtf_lat = new JTextField(60);
	JLabel 	 			jlb_lng = new JLabel("경도");
	JTextField 		jtf_lng = new JTextField(60);
	JButton 			jbtn_save 	= new JButton("저장");
	JButton 			jbtn_close 	= new JButton("닫기");
	
	
	
	public RestINSView() {
		initDisplay();
	}

	//div #d_msg {position : absolute;
	
	public void initDisplay() {
		this.setLayout(null); //기본은 BorderLayout인데 좌표값으로 배치하기 위해서 null로 처리
		jbtn_save.addActionListener(this);
		jbtn_close.addActionListener(this);
		
		this.setSize(500, 600);
		jlb_name.setBounds(20, 20, 100, 20);
		jtf_name.setBounds(120, 20, 150, 20);
		jlb_tel.setBounds(20, 45, 100, 20);
		jtf_tel.setBounds(120, 45, 150, 20);
		jlb_addr.setBounds(20, 70, 100, 20);
		jtf_addr.setBounds(120, 70, 250, 20);
		jlb_photo.setBounds(20, 95, 100, 20);
		jtf_photo.setBounds(120, 95, 150, 20);
		jlb_info.setBounds(20, 120, 100, 20);
		jsp_info.setBounds(120, 120, 300, 80);
		jlb_time.setBounds(20, 205, 100, 20);
		jtf_time.setBounds(120, 205, 250, 20);
		jlb_lat.setBounds(20, 230, 100, 20);
		jtf_lat.setBounds(120, 230, 200, 20);
		jlb_lng.setBounds(20, 255, 100, 20);
		jtf_lng.setBounds(120, 255, 200, 20);
		jbtn_save.setBounds(250, 480, 100, 50);
		jbtn_close.setBounds(360, 480, 100, 50);
		
		this.add(jlb_name);
		this.add(jtf_name);
		this.add(jlb_tel);
		this.add(jtf_tel);
		this.add(jlb_addr);
		this.add(jtf_addr);
		this.add(jlb_photo);
		this.add(jtf_photo);
		this.add(jlb_info);
		this.add(jsp_info);
		this.add(jlb_time);
		this.add(jtf_time);
		this.add(jlb_lat);
		this.add(jtf_lat);
		this.add(jlb_lng);
		this.add(jtf_lng);
		this.add(jbtn_save);
		this.add(jbtn_close);
		this.setVisible(true);
		
	}
	public static void main(String[] args) {
		new RestINSView();
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		
		Object obj = e.getSource();
		if(obj == jbtn_close) {
			System.exit(0);
		}else if(obj == jbtn_save) {
			HashMap<String, Object> pmap = new HashMap<String, Object>();
			pmap.put("res_name", jtf_name.getText());
			pmap.put("res_tel", jtf_tel.getText());
			pmap.put("res_addr", jtf_addr.getText());
			pmap.put("res_photo", jtf_photo.getText());
			pmap.put("res_info", jta_info.getText());
			pmap.put("res_time", jtf_time.getText());
			pmap.put("lat", jtf_lat.getText());
			pmap.put("lng", jtf_lng.getText());
			RestaurantDao rest = new RestaurantDao();
			int result =0;
			result = rest.restINS(pmap);
			if(result==1) {
				JOptionPane.showMessageDialog(this, "등록되었습니다");
				this.dispose();
				this.setVisible(false);
			}
					
		}
		
	}

}
