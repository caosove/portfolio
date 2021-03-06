package patient;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.util.List;
import java.util.regex.Pattern;
import java.awt.event.ActionEvent;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import java.awt.GridLayout;
import java.awt.Color;
import java.awt.Dimension;

import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

import javax.swing.JScrollPane;
import java.awt.FlowLayout;
import javax.swing.SwingConstants;
import java.awt.Font;

public class PatientMain extends JFrame {
	private static final long serialVersionUID = 1L;
	
	private JPanel contentPane;
	private JTextField noTF;
	private JTextField nameTF;
	private JTextField phoneTF;
	private JTextField recordTF;
	private JTextField dateTF;
	private JTextField doctorTF;
	private JTable table;
	private JButton searchBT;
	private JButton insertBT;
	private JButton updateBT;
	private JButton deleteBT;
	private JLabel noLB;
	private DefaultTableModel result;
	private Color disable=new Color(238,238,238);
	private int insertCnt=0;
	private int updateCnt=0;
	Dimension dim = getToolkit().getScreenSize();
	
	int pno2=0;
	String pno="";
	String pname="";
	String pphone="";
	String precord="";
	String pdate="";
	String pdoctor="";

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					PatientMain frame = new PatientMain();
					frame.setVisible(true);
					frame.setTitle("### 환자 관리 프로그램 ###");
				
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		
	}

	/**
	 * Create the frame.
	 */
	
	public PatientMain() {
		Dimension dim = getToolkit().getScreenSize();
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds((dim.width/2)-(882/2), (dim.height/2)-(436/2), 882, 436);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(2, 2, 2, 2));
		contentPane.setLayout(new BorderLayout(0, 0));
		setContentPane(contentPane);
		setResizable(false);
				
		JPanel panel_1 = new JPanel();
		panel_1.setBorder(new EmptyBorder(3, 5, 3, 5));
		panel_1.setBackground(Color.LIGHT_GRAY);
		contentPane.add(panel_1, BorderLayout.WEST);
		panel_1.setLayout(new GridLayout(9, 1, 0, 15));
		
		JPanel panel_2 = new JPanel();
		panel_2.setBackground(Color.LIGHT_GRAY);
		panel_1.add(panel_2);
		panel_2.setLayout(new BorderLayout(0, 0));
		
		noLB = new JLabel("환자정보");
		noLB.setFont(new Font("나눔고딕코딩", Font.BOLD, 12));
		noLB.setBackground(Color.LIGHT_GRAY);
		panel_2.add(noLB, BorderLayout.WEST);
		
		noTF = new JTextField();
		panel_2.add(noTF, BorderLayout.CENTER);
		noTF.setColumns(10);
		noTF.addKeyListener(new KeyEventHandler());
		
		JPanel panel_3 = new JPanel();
		panel_3.setBackground(Color.LIGHT_GRAY);
		panel_1.add(panel_3);
		panel_3.setLayout(new BorderLayout(0, 0));
		
		JLabel nameLB = new JLabel("환자이름");
		nameLB.setFont(new Font("나눔고딕코딩", Font.BOLD, 12));
		nameLB.setBackground(Color.LIGHT_GRAY);
		panel_3.add(nameLB, BorderLayout.WEST);
		
		nameTF = new JTextField();
		panel_3.add(nameTF, BorderLayout.CENTER);
		nameTF.setColumns(10);
		nameTF.addKeyListener(new KeyEventHandler());
		
		JPanel panel = new JPanel();
		panel.setBackground(Color.LIGHT_GRAY);
		panel_1.add(panel);
		panel.setLayout(new BorderLayout(0, 0));
		
		JLabel phoneLB = new JLabel("전화번호");
		phoneLB.setFont(new Font("나눔고딕코딩", Font.BOLD, 12));
		phoneLB.setBackground(Color.LIGHT_GRAY);
		panel.add(phoneLB, BorderLayout.WEST);
		
		phoneTF = new JTextField();
		panel.add(phoneTF, BorderLayout.CENTER);
		phoneTF.setColumns(10);
		phoneTF.addKeyListener(new KeyEventHandler());
		
		JPanel panel_4 = new JPanel();
		panel_4.setBackground(Color.LIGHT_GRAY);
		panel_1.add(panel_4);
		panel_4.setLayout(new BorderLayout(0, 0));
		
		JLabel recordLB = new JLabel("진료내용");
		recordLB.setFont(new Font("나눔고딕코딩", Font.BOLD, 12));
		recordLB.setBackground(Color.LIGHT_GRAY);
		panel_4.add(recordLB, BorderLayout.WEST);
		
		recordTF = new JTextField();
		panel_4.add(recordTF, BorderLayout.CENTER);
		recordTF.setColumns(10);
		recordTF.addKeyListener(new KeyEventHandler());
		
		JPanel panel_5 = new JPanel();
		panel_5.setBackground(Color.LIGHT_GRAY);
		panel_1.add(panel_5);
		panel_5.setLayout(new BorderLayout(0, 0));
		
		JLabel dateLB = new JLabel("내원날짜");
		dateLB.setFont(new Font("나눔고딕코딩", Font.BOLD, 12));
		dateLB.setBackground(Color.LIGHT_GRAY);
		panel_5.add(dateLB, BorderLayout.WEST);
		
		dateTF = new JTextField();
		panel_5.add(dateTF, BorderLayout.CENTER);
		dateTF.setColumns(10);
		dateTF.addKeyListener(new KeyEventHandler());
		
		JPanel panel_6 = new JPanel();
		panel_6.setBackground(Color.LIGHT_GRAY);
		panel_1.add(panel_6);
		panel_6.setLayout(new BorderLayout(0, 0));
		
		JLabel doctorLB = new JLabel("담당의사");
		doctorLB.setFont(new Font("나눔고딕코딩", Font.BOLD, 12));
		doctorLB.setBackground(Color.LIGHT_GRAY);
		panel_6.add(doctorLB, BorderLayout.WEST);
		
		doctorTF = new JTextField();
		panel_6.add(doctorTF, BorderLayout.CENTER);
		doctorTF.setColumns(10);
		doctorTF.addKeyListener(new KeyEventHandler());
		
		JPanel panel_9 = new JPanel();
		panel_9.setBackground(Color.LIGHT_GRAY);
		panel_1.add(panel_9);
		panel_9.setLayout(new BorderLayout(0, 0));
		
		JLabel lblNewLabel_6 = new JLabel("▲▼▲▼▲▼▲▼▲▼▲▼▲▼▲▼▲");
		lblNewLabel_6.setForeground(Color.GRAY);
		lblNewLabel_6.setHorizontalAlignment(SwingConstants.CENTER);
		panel_9.add(lblNewLabel_6);
		
		JPanel panel_7 = new JPanel();
		panel_7.setBackground(Color.LIGHT_GRAY);
		panel_1.add(panel_7);
		panel_7.setLayout(new FlowLayout(FlowLayout.CENTER, 5, 5));
		
		searchBT = new JButton("   검 색 / 취 소 (ESC)   ");
		panel_7.add(searchBT);
		searchBT.setFont(new Font("나눔고딕코딩", Font.BOLD, 12));
		searchBT.addActionListener(new ActionEventHandler());
		searchBT.addKeyListener(new KeyEventHandler());
		
		JPanel panel_8 = new JPanel();
		panel_1.add(panel_8);
		FlowLayout flowLayout = (FlowLayout) panel_8.getLayout();
		flowLayout.setAlignOnBaseline(true);
		panel_8.setBackground(Color.LIGHT_GRAY);
		
		insertBT = new JButton("추가");
		insertBT.setFont(new Font("나눔고딕코딩", Font.BOLD, 12));
		insertBT.addActionListener(new ActionEventHandler());
		insertBT.addKeyListener(new KeyEventHandler());
		panel_8.add(insertBT);
		
		updateBT = new JButton("변경");
		updateBT.setFont(new Font("나눔고딕코딩", Font.BOLD, 12));
		updateBT.addActionListener(new ActionEventHandler());
		updateBT.addKeyListener(new KeyEventHandler());
		panel_8.add(updateBT);
		
		deleteBT = new JButton("삭제");
		deleteBT.setFont(new Font("나눔고딕코딩", Font.BOLD, 12));
		deleteBT.addActionListener(new ActionEventHandler());
		deleteBT.addKeyListener(new KeyEventHandler());
		panel_8.add(deleteBT);
		
		result=new DefaultTableModel(new Object[]{"환자번호", "환자이름", "전화번호", "진료내용", "내원날짜", "담당의사"},0);
		table = new JTable(result);
		table.setFont(new Font("나눔고딕코딩", Font.BOLD, 13));
		table.addKeyListener(new KeyEventHandler());

		JScrollPane scrollPane = new JScrollPane(table);
		contentPane.add(scrollPane, BorderLayout.CENTER);
		
		addKeyListener(new KeyEventHandler());
		init();
	}
	
	public void init() {
		noTF.setEnabled(true);
		noTF.setText("");
		noTF.setBackground(Color.WHITE);
		nameTF.setEnabled(false);
		nameTF.setBackground(disable);
		nameTF.setText("");
		phoneTF.setEnabled(false);
		phoneTF.setBackground(disable);
		phoneTF.setText("");
		recordTF.setEnabled(false);
		recordTF.setBackground(disable);
		recordTF.setText("");
		dateTF.setEnabled(false);
		dateTF.setBackground(disable);
		dateTF.setText("");
		doctorTF.setEnabled(false);
		doctorTF.setBackground(disable);
		doctorTF.setText("");
		result.setRowCount(0);
		insertCnt=0;
		updateCnt=0;
		
		result.setRowCount(0);
		noLB.setText("환자정보");
		List<PatientDTO> pl=PatientDAO.getPatientDAO().selectAllPatient();
		for(PatientDTO p:pl) {
			result.addRow(new Object[]{p.getNo(),p.getName(),p.getPhone(),p.getRecord(),p.getCdate().substring(0, 10),p.getDoctor()});
		}
	}
	
	public void setStatus() {
		noTF.setEnabled(true);
		noTF.setBackground(Color.WHITE);
		nameTF.setText("");
		nameTF.setEnabled(true);
		nameTF.setBackground(Color.WHITE);
		phoneTF.setText("");
		phoneTF.setEnabled(true);
		phoneTF.setBackground(Color.WHITE);
		recordTF.setText("");
		recordTF.setEnabled(true);
		recordTF.setBackground(Color.WHITE);
		dateTF.setText("");
		dateTF.setEnabled(true);
		dateTF.setBackground(Color.WHITE);
		doctorTF.setText("");
		doctorTF.setEnabled(true);
		doctorTF.setBackground(Color.WHITE);
	}
	
	// 세개 중 한개 
	public int oneofthree(String v) {
		int i=0;
				
		List<PatientDTO> noCol=PatientDAO.getPatientDAO().selectOnePatient("no", v);
		if(noCol.size()>0) {
			i=1;
		}
		List<PatientDTO> nameCol=PatientDAO.getPatientDAO().selectOnePatient("name", v);
		if(nameCol.size()>0) {
			i=2;
		}
		List<PatientDTO> phoneCol=PatientDAO.getPatientDAO().selectOnePatient("phone", v);
		if(phoneCol.size()>0) {
			i=3;
		}
		return i;
	}
	
	// 컬럼값 체크
	public int CheckCol(String c) {
		int i=0;
		String noReg="^[1-9]\\d{3}";
		String nameReg="^[가-힣]{2,5}$";
		String phoneReg="(01[016789])-\\d{3,4}-\\d{4}";
		if(Pattern.matches(noReg, c)) {
			pno=c;
			i=1;
		} else if(Pattern.matches(nameReg, c)) {
			pname=c;
			i=2;
		} else if(Pattern.matches(phoneReg, c)) {
			pphone=c;
			i=3;
		} 
		return i;
	}
	
	// 컬럼값 유효성 검사
		public int CheckReg(String v) {
			int i=0;
			String noReg="^[1-9]\\d{3}";
			String nameReg="^[가-힣]{2,5}$";
			String phoneReg="(01[016789])-\\d{3,4}-\\d{4}";
			String dateReg="([12]\\d{3})-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])";
			if(Pattern.matches(noReg, v)) {
				i=1;
			} else if(Pattern.matches(nameReg, v)) {
				i=2;
			} else if(Pattern.matches(phoneReg, v)) {
				i=3;
			} else if(Pattern.matches(dateReg, v)) {
				i=4;
			} 
			return i;
		}
	
	public void getText() {
		pno=noTF.getText();
		pname=nameTF.getText();
		pphone=phoneTF.getText();
		precord=recordTF.getText();
		pdate=dateTF.getText();
		pdoctor=doctorTF.getText();
	}

	
	// 변경값 가져오기
	public void getVar(PatientDTO p) {
		pno=p.getNo()+"";
		pname=p.getName();
		pphone=p.getPhone();
		precord=p.getRecord();
		pdate=p.getCdate();
		pdoctor=p.getDoctor();
		
		noTF.setText(pno);
		nameTF.setText(pname);
		phoneTF.setText(pphone);
		recordTF.setText(precord);
		dateTF.setText(pdate);
		doctorTF.setText(pdoctor);
	}
	
	//검색버튼
	public void searchBTClick() {
		result.setRowCount(0);
		if(noTF.getText().trim().equals("")) {
			init();
		} else {
			int i=CheckCol(noTF.getText());
			if(i==0) {
				JOptionPane.showMessageDialog(this, "입력값이 올바르지 않습니다.\n환자번호 : 1000이상 숫자 4자리\n환자이름 : 한글2~5자리\n핸드폰번호 : 01X-XXXX-XXXX\n항목 중 한가지 형식으로 입력해 주세요.", "오류", JOptionPane.ERROR_MESSAGE);
				init();
			} else if(i==1) {
				if(noLB.getText().equals("환자번호")) {
					init();
					return;
				}
				List<PatientDTO> pl=PatientDAO.getPatientDAO().selectOnePatient("no", noTF.getText());
				if(pl.isEmpty()) {
					JOptionPane.showMessageDialog(this, "검색된 결과가 없습니다\n검색은 환자번호,이름,전화번호만 가능합니다", "에러", JOptionPane.ERROR_MESSAGE);
					init();
				} else {
					result.setRowCount(0);
					for(PatientDTO p:pl) {
						result.addRow(new Object[]{p.getNo(),p.getName(),p.getPhone(),p.getRecord(),p.getCdate().substring(0, 10),p.getDoctor()});
					}
				}
			} else if(i==2){
				List<PatientDTO> pl=PatientDAO.getPatientDAO().selectOnePatient("name", noTF.getText());
				if(pl.isEmpty()) {
					JOptionPane.showMessageDialog(this, "검색된 결과가 없습니다\n검색은 환자번호,이름,전화번호만 가능합니다", "에러", JOptionPane.ERROR_MESSAGE);
					init();
				} else {
					result.setRowCount(0);
					for(PatientDTO p:pl) {
						result.addRow(new Object[]{p.getNo(),p.getName(),p.getPhone(),p.getRecord(),p.getCdate().substring(0, 10),p.getDoctor()});
					}
				}
			} else if(i==3){
				List<PatientDTO> pl=PatientDAO.getPatientDAO().selectOnePatient("phone", noTF.getText());
				if(pl.isEmpty()) {
					JOptionPane.showMessageDialog(this, "검색된 결과가 없습니다\n검색은 환자번호,이름,전화번호만 가능합니다", "에러", JOptionPane.ERROR_MESSAGE);
					init();
				} else {
					result.setRowCount(0);
					for(PatientDTO p:pl) {
						result.addRow(new Object[]{p.getNo(),p.getName(),p.getPhone(),p.getRecord(),p.getCdate().substring(0, 10),p.getDoctor()});
					}
				}
			}
		}
	}
	
	//추가버튼
	public void insertBTClick() {
		if(noTF.getText().trim().equals("")) {
			JOptionPane.showMessageDialog(this, "먼저 추가할 항목을 입력해야 합니다.\n환자번호 : 1000이상 숫자 4자리\n환자이름 : 한글2~5자리\n핸드폰번호 : 01X-XXXX-XXXX\n항목 중 한가지 형식으로 입력해 주세요." , "오류", JOptionPane.ERROR_MESSAGE);
			init();
			return;
		}
		int i=CheckCol(noTF.getText());
		if(insertCnt==1)
			if(i==1) {
				List<PatientDTO> pl=PatientDAO.getPatientDAO().selectOnePatient("no", noTF.getText());
				if(!pl.isEmpty()) {
					JOptionPane.showMessageDialog(this, "이미 등록된 환자번호 입니다." , "오류", JOptionPane.ERROR_MESSAGE);
					insertCnt=0;
				} else {
					setStatus();
					noLB.setText("환자번호");
					noTF.setEnabled(false);
					noTF.setBackground(disable);
				}
			} else if(i==2) {
				setStatus();
				nameTF.setText(noTF.getText());
				nameTF.setEnabled(false);
				nameTF.setBackground(disable);
				noLB.setText("환자번호");
				noTF.setEnabled(true);
				noTF.setText("");
			} else if(i==3) {
				setStatus();
				phoneTF.setText(noTF.getText());
				phoneTF.setEnabled(false);
				phoneTF.setBackground(disable);
				noLB.setText("환자번호");
				noTF.setEnabled(true);
				noTF.setText("");
			} else {
				JOptionPane.showMessageDialog(this, "입력값이 올바르지 않습니다.\n환자번호 : 1000이상 숫자 4자리\n환자이름 : 한글2~5자리\n핸드폰번호 : 01X-XXXX-XXXX\n항목 중 한가지 형식으로 입력해 주세요.", "오류", JOptionPane.ERROR_MESSAGE);
				insertCnt=0;
			}
		if(insertCnt==2) {
			getText();
			PatientDTO p=new PatientDTO();
			if(CheckReg(noTF.getText())==1) {
				p.setNo(Integer.parseInt(noTF.getText()));
			} else {
				JOptionPane.showMessageDialog(this, "환자번호의 입력값이 올바르지 않습니다.\n4자리 숫자로 입력해 주세요.", "오류", JOptionPane.ERROR_MESSAGE);
				insertCnt-=1;
				return;
			}
			if(CheckReg(nameTF.getText())==2) {
				p.setName(nameTF.getText());
			} else {
				JOptionPane.showMessageDialog(this, "환자이름의 입력값이 올바르지 않습니다.\n최대 5자리의 한글로 입력해 주세요.", "오류", JOptionPane.ERROR_MESSAGE);
				insertCnt-=1;
				return;
			}
			if(CheckReg(phoneTF.getText())==3) {
				p.setPhone(phoneTF.getText());
			} else {
				JOptionPane.showMessageDialog(this, "전화번호의 입력값이 올바르지 않습니다.\n01X-XXXX-XXXX 형태로 입력해 주세요.", "오류", JOptionPane.ERROR_MESSAGE);
				insertCnt-=1;
				return;
			}
			if(recordTF.getText()==null || recordTF.getText().trim().equals("")) {
				JOptionPane.showMessageDialog(this, "진료기록이 입력되지 않았습니다.", "오류", JOptionPane.ERROR_MESSAGE);
				insertCnt-=1;
				return;
			} else {
				p.setRecord(recordTF.getText());
			}
			if(CheckReg(dateTF.getText())==4) {
				p.setCdate(dateTF.getText());
			} else {
				JOptionPane.showMessageDialog(this, "내원날짜의 입력값이 올바르지 않습니다.\nYYYY-MM-DD 형태로 입력해 주세요.", "오류", JOptionPane.ERROR_MESSAGE);
				insertCnt-=1;
				return;
			}
			if(CheckReg(doctorTF.getText())==2) {
				p.setDoctor(doctorTF.getText());
			} else {
				JOptionPane.showMessageDialog(this, "담당의사의 입력값이 올바르지 않습니다.\n최대 5자리의 한글로 입력해 주세요.", "오류", JOptionPane.ERROR_MESSAGE);
				insertCnt-=1;
				return;
			}
			
			PatientDAO.getPatientDAO().insertPatient(p);
			result.setRowCount(0);
			result.addRow(new Object[]{p.getNo(),p.getName(),p.getPhone(),p.getRecord(),p.getCdate().substring(0, 10),p.getDoctor()});
			
			JOptionPane.showMessageDialog(this, pname+"님의 환자기록이 추가 되었습니다.", "결과", JOptionPane.OK_OPTION);
			init();
		}
	}
	
	
	//변경버튼
	public void updateBTClick() {
		if(noTF.getText()==null||noTF.getText().trim().equals("")) {
			JOptionPane.showMessageDialog(this, "먼저 변경할 항목을 입력해야 합니다.\n환자번호 : 1000이상 숫자 4자리\n환자이름 : 한글2~5자리\n핸드폰번호 : 01X-XXXX-XXXX\n항목 중 한가지 형식으로 입력해 주세요." , "오류", JOptionPane.ERROR_MESSAGE);
			updateCnt=0;
			init();
			return;
		}
		int i=CheckCol(noTF.getText());
		if(updateCnt==1) {
			if(i==1) {
				setStatus();
				pno2=Integer.parseInt(noTF.getText());
				List<PatientDTO> pl=PatientDAO.getPatientDAO().selectOnePatient("no", noTF.getText());
				if(!pl.isEmpty()) {
					PatientDTO p=PatientDAO.getPatientDAO().selectNoPatient(pno2);
					getVar(p);
					noLB.setText("환자번호");
					noTF.setEnabled(false);
					noTF.setBackground(disable);
				} else {
				JOptionPane.showMessageDialog(this, "검색된 결과가 없습니다\n검색은 환자번호,이름,전화번호만 가능합니다", "에러", JOptionPane.ERROR_MESSAGE);
					init();
				}
			} else if(i==2) {
				List<PatientDTO> pl=PatientDAO.getPatientDAO().selectOnePatient("name", noTF.getText());
				if(pl.size()>1) {
					result.setRowCount(0);
					for(PatientDTO p:pl) {
						result.addRow(new Object[]{p.getNo(),p.getName(),p.getPhone(),p.getRecord(),p.getCdate().substring(0, 10),p.getDoctor()});
					}
					JOptionPane.showMessageDialog(this, "다수의 기록이 존재합니다\n환자번호를 이용하여 다시 검색해주세요", "에러", JOptionPane.ERROR_MESSAGE);
					updateCnt=0;
				} else if(pl.size()==1) {
					PatientDTO p=PatientDAO.getPatientDAO().selectNamePatient(noTF.getText());
					setStatus();
					getVar(p);
					noLB.setText("환자번호");
					noTF.setEnabled(false);
					noTF.setBackground(disable);
					nameTF.setEnabled(false);
					nameTF.setBackground(disable);
				} else {
					JOptionPane.showMessageDialog(this, "검색된 결과가 없습니다\n검색은 환자번호,이름,전화번호만 가능합니다", "에러", JOptionPane.ERROR_MESSAGE);
					init();
				}
			} else if(i==3) {
				List<PatientDTO> pl=PatientDAO.getPatientDAO().selectOnePatient("phone", noTF.getText());
				if(pl.size()>1) {
					result.setRowCount(0);
					for(PatientDTO p:pl) {
						result.addRow(new Object[]{p.getNo(),p.getName(),p.getPhone(),p.getRecord(),p.getCdate().substring(0, 10),p.getDoctor()});
					}
					JOptionPane.showMessageDialog(this, "다수의 기록이 존재합니다\n환자번호를 이용하여 다시 검색해주세요", "에러", JOptionPane.ERROR_MESSAGE);
					updateCnt=0;
				} else if(pl.size()==1) {
					PatientDTO p=PatientDAO.getPatientDAO().selectPhonePatient(noTF.getText());
					setStatus();
					getVar(p);
					noLB.setText("환자번호");
					noTF.setEnabled(false);
					noTF.setBackground(disable);
					phoneTF.setEnabled(false);
					phoneTF.setBackground(disable);
				} else {
					JOptionPane.showMessageDialog(this, "검색된 결과가 없습니다\n검색은 환자번호,이름,전화번호만 가능합니다", "에러", JOptionPane.ERROR_MESSAGE);
					init();
				}
			} else {
				JOptionPane.showMessageDialog(this, "입력값이 올바르지 않습니다.\n환자번호 : 1000이상 숫자 4자리\n환자이름 : 한글2~5자리\n핸드폰번호 : 01X-XXXX-XXXX\n항목 중 한가지 형식으로 입력해 주세요.", "오류", JOptionPane.ERROR_MESSAGE);
				updateCnt=0;
			}
		}
		if(updateCnt==2) {
			PatientDTO p=new PatientDTO();
			if(CheckReg(noTF.getText())==1) {
				p.setNo(Integer.parseInt(noTF.getText()));
			} else {
				JOptionPane.showMessageDialog(this, "환자번호의 입력값이 올바르지 않습니다.\n4자리 숫자로 입력해 주세요.", "오류", JOptionPane.ERROR_MESSAGE);
				updateCnt-=1;
				return;
			}
			if(CheckReg(nameTF.getText())==2) {
				p.setName(nameTF.getText());
			} else {
				JOptionPane.showMessageDialog(this, "환자이름의 입력값이 올바르지 않습니다.\n최대 5자리의 한글로 입력해 주세요.", "오류", JOptionPane.ERROR_MESSAGE);
				updateCnt-=1;
				return;
			}
			if(CheckReg(phoneTF.getText())==3) {
				p.setPhone(phoneTF.getText());
			} else {
				JOptionPane.showMessageDialog(this, "전화번호의 입력값이 올바르지 않습니다.\n01X-XXXX-XXXX 형태로 입력해 주세요.", "오류", JOptionPane.ERROR_MESSAGE);
				updateCnt-=1;
				return;
			}
			if(recordTF.getText()==null || recordTF.getText().trim().equals("")) {
				JOptionPane.showMessageDialog(this, "진료기록이 입력되지 않았습니다.", "오류", JOptionPane.ERROR_MESSAGE);
				updateCnt-=1;
				return;
			} else {
				p.setRecord(recordTF.getText());
			}
			if(CheckReg(dateTF.getText())==4) {
				p.setCdate(dateTF.getText());
			} else {
				JOptionPane.showMessageDialog(this, "내원날짜의 입력값이 올바르지 않습니다.\nYYYY-MM-DD 형태로 입력해 주세요.", "오류", JOptionPane.ERROR_MESSAGE);
				updateCnt-=1;
				return;
			}
			if(CheckReg(doctorTF.getText())==2) {
				p.setDoctor(doctorTF.getText());
			} else {
				JOptionPane.showMessageDialog(this, "담당의사의 입력값이 올바르지 않습니다.\n최대 5자리의 한글로 입력해 주세요.", "오류", JOptionPane.ERROR_MESSAGE);
				updateCnt-=1;
				return;
			}
			
			if(!pno.equals(noTF.getText())) pno2=Integer.parseInt(noTF.getText());
			if(!pname.equals(nameTF.getText())) pname=nameTF.getText();
			if(!pphone.equals(phoneTF.getText())) pphone=phoneTF.getText();
			if(!precord.equals(recordTF.getText()))  precord=recordTF.getText();
			if(!pdate.equals(dateTF.getText()))  pdate=dateTF.getText();
			if(!pdoctor.equals(doctorTF.getText()))  pdoctor=doctorTF.getText();
		
			p.setNo(pno2);
			p.setName(pname);
			p.setPhone(pphone);
			p.setRecord(precord);
			p.setCdate(pdate);
			p.setDoctor(pdoctor);
				
			PatientDAO.getPatientDAO().updatePatient(p);
			result.setRowCount(0);
			result.addRow(new Object[]{p.getNo(),p.getName(),p.getPhone(),p.getRecord(),p.getCdate().substring(0, 10),p.getDoctor()});
			
			JOptionPane.showMessageDialog(this, pname+"님의 환자기록이 변경 되었습니다.", "결과", JOptionPane.OK_OPTION);
			init();
		}
	}
	
	//삭제버튼
	public void deleteBTClick() {
		if(noTF.getText()==null || noTF.getText().trim().equals("")) {
			JOptionPane.showMessageDialog(this, "먼저 삭제할 항목을 입력해야 합니다.\n환자번호 : 1000이상 숫자 4자리\n환자이름 : 한글2~5자리\n핸드폰번호 : 01X-XXXX-XXXX\n항목 중 한가지 형식으로 입력해 주세요." , "오류", JOptionPane.ERROR_MESSAGE);
			init();
			return;
		}
		int i=CheckCol(noTF.getText());
		if(i==1) {
			pno2=Integer.parseInt(noTF.getText());
			List<PatientDTO> pl=PatientDAO.getPatientDAO().selectOnePatient("no", noTF.getText());
			if(pl.size()==1) {
				result.setRowCount(0);
				for(PatientDTO p:pl) {
					result.addRow(new Object[]{p.getNo(),p.getName(),p.getPhone(),p.getRecord(),p.getCdate().substring(0, 10),p.getDoctor()});
				}
				int choice=JOptionPane.showConfirmDialog(this,pno+"번 환자기록을 삭제 하시겠습니까?" , "삭제", JOptionPane.YES_NO_OPTION);
				if(choice==0) {
					PatientDAO.getPatientDAO().deletePatient(pno2);
					JOptionPane.showMessageDialog(this, pno+"번 환자기록이 삭제 되었습니다." , "삭제", JOptionPane.OK_OPTION);
					init();
				} else {
					init();
				}
			} else {
				JOptionPane.showMessageDialog(this, "검색된 결과가 없습니다\n검색은 환자번호,이름,전화번호만 가능합니다", "에러", JOptionPane.ERROR_MESSAGE);	
			}
		} else if(i==2) {
			List<PatientDTO> pl=PatientDAO.getPatientDAO().selectOnePatient("name", noTF.getText());
			if(pl.size()>1) {
				result.setRowCount(0);
				for(PatientDTO p:pl) {
					result.addRow(new Object[]{p.getNo(),p.getName(),p.getPhone(),p.getRecord(),p.getCdate().substring(0, 10),p.getDoctor()});
				}
				JOptionPane.showMessageDialog(this, "다수의 기록이 존재합니다\n환자번호를 이용하여 다시 검색해주세요", "에러", JOptionPane.ERROR_MESSAGE);
			} else if(pl.size()==1) {
				PatientDTO p=PatientDAO.getPatientDAO().selectNamePatient(pname);
				result.setRowCount(0);
				result.addRow(new Object[]{p.getNo(),p.getName(),p.getPhone(),p.getRecord(),p.getCdate().substring(0, 10),p.getDoctor()});
				int choice=JOptionPane.showConfirmDialog(this,pname+"님의 환자기록을 삭제 하시겠습니까?" , "삭제", JOptionPane.YES_NO_OPTION);
				if(choice==0) {
					PatientDAO.getPatientDAO().deleteNamePatient(noTF.getText());
					JOptionPane.showMessageDialog(this, pname+"님의 환자기록이 삭제 되었습니다." , "삭제", JOptionPane.OK_OPTION);
					init();
				} else {
					init();
				}
			} else {
				JOptionPane.showMessageDialog(this, "검색된 결과가 없습니다\n검색은 환자번호,이름,전화번호만 가능합니다", "에러", JOptionPane.ERROR_MESSAGE);
			}
		} else if(i==3) {
			List<PatientDTO> pl=PatientDAO.getPatientDAO().selectOnePatient("phone", noTF.getText());
			System.out.println(pl.size());
			if(pl.size()>1) {
				result.setRowCount(0);
				for(PatientDTO p:pl) {
					result.addRow(new Object[]{p.getNo(),p.getName(),p.getPhone(),p.getRecord(),p.getCdate().substring(0, 10),p.getDoctor()});
				}
				JOptionPane.showMessageDialog(this, "다수의 기록이 존재합니다\n환자번호를 이용하여 다시 검색해주세요", "에러", JOptionPane.ERROR_MESSAGE);
			} else if(pl.size()==1) {
				PatientDTO p=PatientDAO.getPatientDAO().selectPhonePatient(pphone);
				result.setRowCount(0);
				result.addRow(new Object[]{p.getNo(),p.getName(),p.getPhone(),p.getRecord(),p.getCdate().substring(0, 10),p.getDoctor()});
				int choice=JOptionPane.showConfirmDialog(this,pno+"번 환자기록을 삭제 하시겠습니까?" , "삭제", JOptionPane.YES_NO_OPTION);
				if(choice==0) {
					PatientDAO.getPatientDAO().deletePhonePatient(noTF.getText());
					JOptionPane.showMessageDialog(this, pno+"번 환자기록이 삭제 되었습니다." , "삭제", JOptionPane.OK_OPTION);
					init();
				} else {
					init();
				}
			} else {
				JOptionPane.showMessageDialog(this, "검색된 결과가 없습니다\n검색은 환자번호,이름,전화번호만 가능합니다", "에러", JOptionPane.ERROR_MESSAGE);
			}
		} else {
			JOptionPane.showMessageDialog(this, "입력값이 올바르지 않습니다.\n환자번호 : 1000이상 숫자 4자리\n환자이름 : 한글2~5자리\n핸드폰번호 : 01X-XXXX-XXXX\n항목 중 한가지 형식으로 입력해 주세요.", "오류", JOptionPane.ERROR_MESSAGE);
		}
	}
	
	public class ActionEventHandler implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e) {
			if(e.getSource() instanceof JButton) {
				if(e.getSource()==searchBT) {
					searchBTClick();
				} if(e.getSource()==insertBT) {
					insertCnt++;
					insertBTClick();
				} if(e.getSource()==updateBT) {
					updateCnt++;
					updateBTClick();
				} if(e.getSource()==deleteBT) {
					deleteBTClick();
				}
			}
		}
	}
	
	public class KeyEventHandler implements KeyListener {

		@Override
		public void keyTyped(KeyEvent e) {
		}
		@Override
		public void keyPressed(KeyEvent e) {
			if(e.getKeyCode()==KeyEvent.VK_ESCAPE) {
				result.setRowCount(0);
				init();
			}
		}
		@Override
		public void keyReleased(KeyEvent e) {
		}
	}
	

}
