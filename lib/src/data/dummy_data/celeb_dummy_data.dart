import 'package:egomoya/src/data/dto/celeb/celeb.dart';
import 'package:egomoya/src/data/dto/celeb/celeb_item.dart';
import 'package:egomoya/src/data/enum/celeb_type.dart';

class CelebDummyData {
  static List<Celeb> celebData = [
    // 웬디
    Celeb(
      category: CelebPostCategory.beauty,
      imgPath: 'assets/images/celeb/beauty/wendy.png',
      celebName: '웬디',
      instaLink:
          'https://www.instagram.com/p/C41mjuJttfv/?igsh=dWM5czRod2dyMXl3'
              .trim(),
      likeCnt: 17,
      createdAt: DateTime(2024, 2, 20, 17, 30),
      updatedAt: DateTime(2024, 2, 20, 17, 30),
      itemList: [
        CelebItem(
          imgPath: 'assets/images/celeb/beauty/wendy_item1.png',
          brand: '나스',
          itemName: '파워매트 립스틱 - 스윗 디스포지션',
          price: 45000,
          currency: '₩',
        ),
        CelebItem(
          imgPath: 'assets/images/celeb/beauty/wendy_item2.png',
          brand: '롬앤',
          itemName: '쥬시 래스팅 틴트 - 베어바인',
          price: 13000,
          currency: '₩',
        ),
      ],
    ),
    // 리사
    Celeb(
      category: CelebPostCategory.beauty,
      imgPath: 'assets/images/celeb/beauty/lisa.png',
      celebName: 'BLACKPINK – 리사',
      instaLink:
          ' https://www.instagram.com/p/C4g0UJ4yg0n/?igsh=YjFoZ2dsdnRidmt1'
              .trim(),
      likeCnt: 2,
      createdAt: DateTime(2024, 2, 21, 17, 30),
      updatedAt: DateTime(2024, 2, 21, 17, 30),
      itemList: [
        CelebItem(
          imgPath: 'assets/images/celeb/beauty/lisa_item1.png',
          brand: 'KIKO',
          itemName: 'Days In Bloom Multi - Faceted Eyeshadow Palette 01',
          price: 22.99,
          currency: '£',
        ),
        CelebItem(
          imgPath: 'assets/images/celeb/beauty/lisa_item2.png',
          brand: '크리니크',
          itemName: '치크 팝 – 팬지팝',
          price: 36000,
          currency: '₩',
        ),
        CelebItem(
          imgPath: 'assets/images/celeb/beauty/lisa_item3.png',
          brand: '후다 뷰티',
          itemName: '립 컨투어 2.0 – 허니베이지',
          price: 35300,
          currency: '₩',
        ),
        CelebItem(
          imgPath: 'assets/images/celeb/beauty/lisa_item4.png',
          brand: '에뛰드',
          itemName: '프루티 듀이 립틴트 – 01 하트팝시클',
          price: 13000,
          currency: '₩',
        ),
      ],
    ),
    // 채원
    Celeb(
      category: CelebPostCategory.beauty,
      imgPath: 'assets/images/celeb/beauty/chaewon.png',
      celebName: 'LE SSERAFIM – 채원',
      likeCnt: 23,
      createdAt: DateTime(2024, 2, 20, 19, 30),
      updatedAt: DateTime(2024, 2, 20, 19, 30),
      instaLink:
          'https://www.instagram.com/p/C4CNiKdMevn/?igsh=cG8xazl4czA4ajAx'
              .trim(),
      itemList: [
        CelebItem(
          imgPath: 'assets/images/celeb/beauty/chaewon_item1.png',
          brand: '메이크업포에버',
          itemName: '루즈 아티스트 벨벳 누드 – 101 페일 핑크',
          price: 40000,
          currency: '₩',
        ),
      ],
    ),
    // 엄지
    Celeb(
      category: CelebPostCategory.beauty,
      imgPath: 'assets/images/celeb/beauty/umji.png',
      celebName: 'VIVIZ – 엄지',
      instaLink:
          'https://www.instagram.com/p/C3_lSj3oSBm/?igsh=MTY5bDB0empsb2J1Mg=='
              .trim(),
      likeCnt: 1,
      createdAt: DateTime(2024, 2, 20, 20, 30),
      updatedAt: DateTime(2024, 2, 20, 20, 30),
      itemList: [
        CelebItem(
          imgPath: 'assets/images/celeb/beauty/umji_item1.png',
          brand: '데이지크',
          itemName: '럭스 글로우 하이라이터 - 아이스라벤더',
          price: 29000,
          currency: '₩',
        ),
        CelebItem(
          imgPath: 'assets/images/celeb/beauty/umji_item2.png',
          brand: '나스',
          itemName: '블러쉬 - 오르가즘',
          price: 45000,
          currency: '₩',
        ),
      ],
    ),
    // 강나언
    Celeb(
      category: CelebPostCategory.beauty,
      imgPath: 'assets/images/celeb/beauty/gangnaun.png',
      celebName: '강나언',
      instaLink:
          'https://www.instagram.com/p/C4NB_P2JsqS/?igsh=MThlOTg4bzNpc3dxMg=='
              .trim(),
      likeCnt: 4,
      createdAt: DateTime(2024, 3, 3, 2, 30),
      updatedAt: DateTime(2024, 3, 3, 2, 30),
      itemList: [
        CelebItem(
          imgPath: 'assets/images/celeb/beauty/gangnaun_item1.png',
          brand: '레미유',
          itemName: '듀이 플로우 틴트 – 11 쿠키 드롭',
          price: 19000,
          currency: '₩',
        ),
        CelebItem(
          imgPath: 'assets/images/celeb/beauty/gangnaun_item2.png',
          brand: 'AOU',
          itemName: '글로이 틴트 밤 - 04 앵두밤',
          price: 15400,
          currency: '₩',
        ),
      ],
    ),
    // 나띠
    Celeb(
      category: CelebPostCategory.beauty,
      imgPath: 'assets/images/celeb/beauty/natti.png',
      celebName: '나띠',
      instaLink:
          'https://www.instagram.com/p/C44LXokpfwH/?igsh=azhxM2ZpaHp1aXJr'
              .trim(),
      likeCnt: 11,
      createdAt: DateTime(2024, 3, 4, 2, 30),
      updatedAt: DateTime(2024, 3, 4, 2, 30),
      itemList: [
        CelebItem(
          imgPath: 'assets/images/celeb/beauty/natti_item1.png',
          brand: '샤넬 뷰티',
          itemName: '레 꺄트르 옹브르 코랄 트레저',
          price: 96000,
          currency: '₩',
        ),
        CelebItem(
          imgPath: 'assets/images/celeb/beauty/natti_item2.png',
          brand: '구찌 뷰티',
          itemName: '블러시 드 보떼 치크 & 아이 파우더 - 03 래디언트 핑크',
          price: 93400,
          currency: '₩',
        ),
      ],
    ),

    // 유나
    Celeb(
      category: CelebPostCategory.fashion,
      imgPath: 'assets/images/celeb/fashion/una.png',
      celebName: 'ITZY - 유나',
      instaLink:
          'https://www.instagram.com/p/C5AwUJpRD8z/?igsh=b2E5dnFwc294Z3Js'
              .trim(),
      likeCnt: 11,
      createdAt: DateTime(2024, 3, 5, 2, 30),
      updatedAt: DateTime(2024, 3, 5, 2, 30),
      itemList: [
        CelebItem(
          imgPath: 'assets/images/celeb/fashion/una_item1.png',
          brand: '오드원아웃',
          itemName: 'Combi knit cardigan_Navy',
          price: 104000,
          currency: '₩',
        ),
      ],
    ),
    // 은하
    Celeb(
      category: CelebPostCategory.fashion,
      imgPath: 'assets/images/celeb/fashion/enha.png',
      celebName: 'VIVIZ - 은하',
      instaLink:
          'https://www.instagram.com/p/C5Fd36xStje/?igsh=MXNyZWJnZ2hqc292Zg=='
              .trim(),
      likeCnt: 23,
      createdAt: DateTime(2024, 3, 6, 1, 30),
      updatedAt: DateTime(2024, 3, 6, 2, 30),
      itemList: [
        CelebItem(
          imgPath: 'assets/images/celeb/fashion/enha_item1.png',
          brand: '노피셜노피스',
          itemName: '리본 오프숄더 탑 차콜',
          price: 58000,
          currency: '₩',
        ),
      ],
    ),
    // 태연(정보 추가 필요)
    Celeb(
      category: CelebPostCategory.fashion,
      imgPath: 'assets/images/celeb/fashion/taeyeon.png',
      celebName: '태연',
      instaLink:
          'https://www.instagram.com/p/C3aUcSxBD7N/?igsh=MWZubmI1Y3d3OXRuYg=='
              .trim(),
      likeCnt: 12,
      createdAt: DateTime(2024, 3, 9, 1, 30),
      updatedAt: DateTime(2024, 3, 9, 2, 30),
      itemList: [
        CelebItem(
          imgPath: 'assets/images/celeb/fashion/taeyeon_item1.png',
          brand: '마르디메르크디',
          itemName: 'CASHMERE BLENDED CARDIGAN ROUND NECK_Grey Green',
          price: 138000,
          currency: '₩',
        ),
        CelebItem(
          imgPath: 'assets/images/celeb/fashion/taeyeon_item2.png',
          brand: '에즈이프캘리',
          itemName: 'CALIE GURLS T-SHIRT WHITE',
          price: 49000,
          currency: '₩',
        ),
        CelebItem(
          imgPath: 'assets/images/celeb/fashion/taeyeon_item3.png',
          brand: '마르디메르크디',
          itemName: 'BALLOON MINI SKIRT CRINKLED',
          price: 108000,
          currency: '₩',
        ),
      ],
    ),
    // 정소민
    Celeb(
      category: CelebPostCategory.fashion,
      imgPath: 'assets/images/celeb/fashion/jungsomin.png',
      celebName: '정소민',
      instaLink:
          'https://www.instagram.com/p/C4nN4ESB494/?igsh=MXkxOGI3emxwYWUyZw=='
              .trim(),
      likeCnt: 12,
      createdAt: DateTime(2024, 3, 23, 1, 30),
      updatedAt: DateTime(2024, 3, 23, 2, 30),
      itemList: [
        CelebItem(
          imgPath: 'assets/images/celeb/fashion/jungsomin_item1.png',
          brand: '인지액티브',
          itemName: '핑거홀 크롭 니트 _ 아이보리',
          price: 89000,
          currency: '₩',
        ),
        CelebItem(
          imgPath: 'assets/images/celeb/fashion/jungsomin_item2.png',
          brand: '마르헨제이',
          itemName: '팝콘백 스윙 _ 블랙',
          price: 149000,
          currency: '₩',
        ),
      ],
    ),
    // 김유정
    Celeb(
      category: CelebPostCategory.fashion,
      imgPath: 'assets/images/celeb/fashion/kimyoojung.png',
      celebName: '김유정',
      instaLink:
          'https://www.instagram.com/p/C5AFs69ScGS/?igsh=MTdwcDl6a3BibGZuMA=='
              .trim(),
      likeCnt: 12,
      createdAt: DateTime(2024, 4, 1, 1, 30),
      updatedAt: DateTime(2024, 4, 1, 2, 30),
      itemList: [
        CelebItem(
          imgPath: 'assets/images/celeb/fashion/kimyoojung_item1.png',
          brand: '스테이위드미',
          itemName: '부클레 트위드 울 재킷',
          price: 289000,
          currency: '₩',
        ),
      ],
    ),
  ];
}
