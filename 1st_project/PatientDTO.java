package patient;

public class PatientDTO {
	private int no;
	private String name;
	private String phone;
	private String record;
	private String cdate;
	private String doctor;
	
	public PatientDTO() {
		// TODO Auto-generated constructor stub
	}

	public PatientDTO(int no, String name, String phone, String record, String cdate, String doctor) {
		super();
		this.no = no;
		this.name = name;
		this.phone = phone;
		this.record = record;
		this.cdate = cdate;
		this.doctor = doctor;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRecord() {
		return record;
	}

	public void setRecord(String record) {
		this.record = record;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public String getDoctor() {
		return doctor;
	}

	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}
	
	
}
