package it.will.kingsmap.getMetod;

import java.util.HashMap;
import java.util.Map;

import it.will.kingsmap_mybatis.dto.GosimoonDTO;
import it.will.kingsmap_mybatis.dto.MapDTO;

public class Feasibility {

	public Map<String, Object> execute(GosimoonDTO bunyangdtos, MapDTO kinglistdtos, int jobunyangga, int bunyangga,
			int imbunyangga) {

		Map<String, Object> map = new HashMap<String, Object>();

		float jobi=0;
		// 고시문
		int totalmember = bunyangdtos.getTotalmember();
		int realmember = bunyangdtos.getRealmember();
		int ThreeNineim = bunyangdtos.getThreeNineim();
		int fourNineim = bunyangdtos.getFourNineim();
		int ThreeNine = bunyangdtos.getThreeNine();
		int fourNine = bunyangdtos.getFourNine();
		int fiveone = bunyangdtos.getFiveone();
		int fiveNine = bunyangdtos.getFiveNine();
		int sixsix = bunyangdtos.getSixsix();
		int seventwo = bunyangdtos.getSeventwo();
		int eightfour = bunyangdtos.getEightfour();
		int ninefive = bunyangdtos.getNinefive();
		int onezeroone = bunyangdtos.getOnezeroone();
		int oneonetwo = bunyangdtos.getOneonetwo();
		int oneonefive = bunyangdtos.getOneonefive();
		int onetwozero = bunyangdtos.getOnetwozero();
		int onethreetwo = bunyangdtos.getOnethreetwo();
		int onethreefive = bunyangdtos.getOnethreefive();
		int onefourfive = bunyangdtos.getOnefourfive();
		int onefourseven = bunyangdtos.getOnefourseven();
		int checkgosimun = bunyangdtos.getCheckgosimun();
		// 조합원분 갯수
		int ThreeNinejo = (int) (ThreeNine / (1 + jobi));
		int fourNinejo = (int) (fourNine / (1 + jobi));
		int fiveonejo = (int) (fiveone / (1 + jobi));
		int fiveNinejo = (int) (fiveNine / (1 + jobi));
		int sixsixjo = (int) (sixsix / (1 + jobi));
		int seventwojo = (int) (seventwo / (1 + jobi));
		int eightfourjo = (int) (eightfour / (1 + jobi));
		int ninefivejo = (int) (ninefive / (1 + jobi));
		int onezeroonejo = (int) (onezeroone / (1 + jobi));
		int oneonetwojo = (int) (oneonetwo / (1 + jobi));
		int oneonefivejo = (int) (oneonefive / (1 + jobi));
		int onetwozerojo = (int) (onetwozero / (1 + jobi));
		int onethreetwojo = (int) (onethreetwo / (1 + jobi));
		int onethreefivejo = (int) (onethreefive / (1 + jobi));
		int onefourfivejo = (int) (onefourfive / (1 + jobi));
		int onefoursevenjo = (int) (onefourseven / (1 + jobi));
		// 일반분양분
		int ThreeNine1 = (int) (ThreeNinejo * jobi);
		int fourNine1 = (int) (fourNinejo * jobi);
		int fiveone1 = (int) (fiveonejo * jobi);
		int fiveNine1 = (int) (fiveNinejo * jobi);
		int sixsix1 = (int) (sixsixjo * jobi);
		int seventwo1 = (int) (seventwojo * jobi);
		int eightfour1 = (int) (eightfourjo * jobi);
		int ninefive1 = (int) (ninefivejo * jobi);
		int onezeroone1 = (int) (onezeroonejo * jobi);
		int oneonetwo1 = (int) (oneonetwojo * jobi);
		int oneonefive1 = (int) (oneonefivejo * jobi);
		int onetwozero1 = (int) (onetwozerojo * jobi);
		int onethreetwo1 = (int) (onethreetwojo * jobi);
		int onethreefive1 = (int) (onethreefivejo * jobi);
		int onefourfive1 = (int) (onefourfivejo * jobi);
		int onefourseven1 = (int) (onefoursevenjo * jobi);

		int ThreeNineimSum=0;
		int fourNineimSum;
		int ThreeNineSum;
		int fourNineSum;
		int fiveoneSum;
		int fiveNineSum;
		int sixsixSum;
		int seventwoSum;
		int eightfourSum;
		int ninefiveSum;
		int onezerooneSum;
		int oneonetwoSum;
		int oneonefiveSum;
		int onetwozeroSum;
		int onethreetwoSum;
		int onethreefiveSum;
		int onefourfiveSum;
		int onefoursevenSum;

		// 39타입 임대분 수익
		if (bunyangdtos.getThreeNineim() != 0) {
			ThreeNineimSum = bunyangdtos.getThreeNineim() * 17 * imbunyangga;
		} else {
			ThreeNineimSum = 0;
		}
		// 49타입 임대분 수익
		if (bunyangdtos.getFourNineim() != 0) {
			fourNineimSum = bunyangdtos.getFourNineim() * 19 * imbunyangga;
		} else {
			fourNineimSum = 0;
		}
		// 39타입 조분,일분 수익
		if (bunyangdtos.getThreeNine() != 0) {
			ThreeNineSum = (ThreeNinejo * jobunyangga * 17) + (ThreeNine1 * bunyangga * 17);
		} else {
			ThreeNineSum = 0;
		}
		// 49타입 조분,일분 수익
		if (bunyangdtos.getFourNine() != 0) {
			fourNineSum = (fourNinejo * jobunyangga * 20) + (fourNine1 * bunyangga * 20);
		} else {
			fourNineSum = 0;
		}
		// 51타입 조분,일분 수익
		if (bunyangdtos.getFiveone() != 0) {
			fiveoneSum = (fiveonejo * jobunyangga * 21) + (fiveone1 * bunyangga * 21);
		} else {
			fiveoneSum = 0;
		}
		// 59타입 조분,일분 수익
		if (bunyangdtos.getFiveNine() != 0) {
			fiveNineSum = (fiveNinejo * jobunyangga * 25) + (fiveNine1 * bunyangga * 25);
		} else {
			fiveNineSum = 0;
		}
		// 66타입 조분,일분 수익
		if (bunyangdtos.getSixsix() != 0) {
			sixsixSum = (sixsixjo * jobunyangga * 27) + (sixsix1 * bunyangga * 27);
		} else {
			sixsixSum = 0;
		}
		// 72타입 조분,일분 수익
		if (bunyangdtos.getSeventwo() != 0) {
			seventwoSum = (seventwojo * jobunyangga * 29) + (seventwo1 * bunyangga * 29);
		} else {
			seventwoSum = 0;
		}
		// 84타입 조분,일분 수익
		if (bunyangdtos.getEightfour() != 0) {
			eightfourSum = (eightfourjo * jobunyangga * 33) + (eightfour1 * bunyangga * 33);
		} else {
			eightfourSum = 0;
		}
		// 95타입 조분,일분 수익
		if (bunyangdtos.getNinefive() != 0) {
			ninefiveSum = (ninefivejo * jobunyangga * 36) + (ninefive1 * bunyangga * 36);
		} else {
			ninefiveSum = 0;
		}
		// 101타입 조분,일분 수익
		if (bunyangdtos.getOnezeroone() != 0) {
			onezerooneSum = (onezeroonejo * jobunyangga * 38) + (onezeroone1 * bunyangga * 38);
		} else {
			onezerooneSum = 0;
		}
		// 112타입 조분,일분 수익
		if (bunyangdtos.getOneonetwo() != 0) {
			oneonetwoSum = (oneonetwojo * jobunyangga * 41) + (oneonetwo1 * bunyangga * 41);
		} else {
			oneonetwoSum = 0;
		}
		// 115타입 조분,일분 수익
		if (bunyangdtos.getOneonefive() != 0) {
			oneonefiveSum = (oneonefivejo * jobunyangga * 42) + (oneonefive1 * bunyangga * 42);
		} else {
			oneonefiveSum = 0;
		}
		// 120타입 조분,일분 수익
		if (bunyangdtos.getOnetwozero() != 0) {
			onetwozeroSum = (onetwozerojo * jobunyangga * 43) + (onetwozero1 * bunyangga * 43);
		} else {
			onetwozeroSum = 0;
		}
		// 132타입 조분,일분 수익
		if (bunyangdtos.getOnethreetwo() != 0) {
			onethreetwoSum = (onethreetwojo * jobunyangga * 47) + (onethreetwo1 * bunyangga * 47);
		} else {
			onethreetwoSum = 0;
		}
		// 135타입 조분,일분 수익
		if (bunyangdtos.getOnethreefive() != 0) {
			onethreefiveSum = (onethreefivejo * jobunyangga * 48) + (onethreefive1 * bunyangga * 48);
		} else {
			onethreefiveSum = 0;
		}
		// 145타입 조분,일분 수익
		if (bunyangdtos.getOnefourfive() != 0) {
			onefourfiveSum = (onefourfivejo * jobunyangga * 51) + (onefourfive1 * bunyangga * 51);
		} else {
			onefourfiveSum = 0;
		}
		// 147타입 조분,일분 수익
		if (bunyangdtos.getOnefourseven() != 0) {
			onefoursevenSum = (onefoursevenjo * jobunyangga * 52) + (onefourseven1 * bunyangga * 52);
		} else {
			onefoursevenSum = 0;
		}

		return map;
	}

}
