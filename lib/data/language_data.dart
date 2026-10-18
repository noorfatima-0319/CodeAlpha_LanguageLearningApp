import 'package:lingo/models/language.dart';

const langs = <String, Lang>{
  'es': Lang('Spanish', '🇪🇸', {
    'Greetings': [['Hello', 'Hola', 'OH-lah'], ['Good morning', 'Buenos días', 'BWEH-nos DEE-as'], ['Good night', 'Buenas noches', 'BWEH-nas NO-ches'], ['Goodbye', 'Adiós', 'ah-DYOHS'], ['Please', 'Por favor', 'por fah-VOR'], ['Thank you', 'Gracias', 'GRAH-syas']],
    'Food': [['Water', 'Agua', 'AH-gwah'], ['Bread', 'Pan', 'pahn'], ['Apple', 'Manzana', 'man-SAH-nah'], ['Milk', 'Leche', 'LEH-cheh'], ['Rice', 'Arroz', 'ah-ROHS'], ['Chicken', 'Pollo', 'POH-yo']],
    'Numbers': [['One', 'Uno', 'OO-no'], ['Two', 'Dos', 'dohs'], ['Three', 'Tres', 'trehs'], ['Four', 'Cuatro', 'KWAH-tro'], ['Five', 'Cinco', 'SEEN-ko'], ['Ten', 'Diez', 'dyehs']],
    'Phrases': [['How are you?', '¿Cómo estás?', 'KOH-mo es-TAHS'], ['My name is...', 'Me llamo...', 'meh YAH-mo'], ['Where is the bathroom?', '¿Dónde está el baño?', 'DON-deh es-TAH el BAH-nyo'], ["I don't understand", 'No entiendo', 'no en-TYEN-do'], ['How much is it?', '¿Cuánto cuesta?', 'KWAN-to KWES-ta'], ['I am hungry', 'Tengo hambre', 'TEN-go AM-breh']],
    'Grammar': [['I am', 'Yo soy', 'yo soy'], ['You are', 'Tú eres', 'too EH-res'], ['He is', 'Él es', 'el es'], ['We are', 'Nosotros somos', 'no-SO-tros SO-mos'], ['I have', 'Yo tengo', 'yo TEN-go'], ['I want', 'Yo quiero', 'yo KYEH-ro']],
  }),
  'fr': Lang('French', '🇫🇷', {
    'Greetings': [['Hello', 'Bonjour', 'bon-ZHOOR'], ['Good evening', 'Bonsoir', 'bon-SWAHR'], ['Good night', 'Bonne nuit', 'bun NWEE'], ['Goodbye', 'Au revoir', 'oh ruh-VWAHR'], ['Please', "S'il vous plaît", 'seel voo PLEH'], ['Thank you', 'Merci', 'mehr-SEE']],
    'Food': [['Water', 'Eau', 'oh'], ['Bread', 'Pain', 'pan'], ['Apple', 'Pomme', 'pom'], ['Milk', 'Lait', 'leh'], ['Cheese', 'Fromage', 'fro-MAHZH'], ['Chicken', 'Poulet', 'poo-LEH']],
    'Numbers': [['One', 'Un', 'uh'], ['Two', 'Deux', 'duh'], ['Three', 'Trois', 'trwah'], ['Four', 'Quatre', 'KAH-truh'], ['Five', 'Cinq', 'sank'], ['Ten', 'Dix', 'dees']],
    'Phrases': [['How are you?', 'Comment allez-vous ?', 'ko-mon tal-ay VOO'], ['My name is...', "Je m'appelle...", 'zhuh mah-PEL'], ['Where is the bathroom?', 'Où sont les toilettes ?', 'oo son lay twa-LET'], ["I don't understand", 'Je ne comprends pas', 'zhuh nuh kom-PRON pah'], ['How much is it?', 'Combien ça coûte ?', 'kom-BYAN sah KOOT'], ['I am hungry', "J'ai faim", 'zhay fan']],
    'Grammar': [['I am', 'Je suis', 'zhuh SWEE'], ['You are', 'Tu es', 'too EH'], ['He is', 'Il est', 'eel EH'], ['We are', 'Nous sommes', 'noo SOM'], ['I have', "J'ai", 'zhay'], ['I want', 'Je veux', 'zhuh VUH']],
  }),
  'ur': Lang('Urdu', '🇵🇰', {
    'Greetings': [['Hello (Peace be upon you)', 'السلام علیکم', 'as-salaam-u-alaikum'], ['Good morning', 'صبح بخیر', 'subah bakhair'], ['Good night', 'شب بخیر', 'shab bakhair'], ['Goodbye', 'خدا حافظ', 'khuda hafiz'], ['Please', 'مہربانی', 'meherbani'], ['Thank you', 'شکریہ', 'shukriya']],
    'Food': [['Water', 'پانی', 'paani'], ['Bread', 'روٹی', 'roti'], ['Apple', 'سیب', 'seb'], ['Milk', 'دودھ', 'doodh'], ['Rice', 'چاول', 'chawal'], ['Chicken', 'مرغی', 'murghi']],
    'Numbers': [['One', 'ایک', 'ek'], ['Two', 'دو', 'do'], ['Three', 'تین', 'teen'], ['Four', 'چار', 'chaar'], ['Five', 'پانچ', 'paanch'], ['Ten', 'دس', 'das']],
    'Phrases': [['How are you?', 'آپ کیسے ہیں؟', 'aap kaise hain'], ['My name is...', 'میرا نام ... ہے', 'mera naam ... hai'], ['Where is the bathroom?', 'باتھ روم کہاں ہے؟', 'bathroom kahan hai'], ["I don't understand", 'مجھے سمجھ نہیں آئی', 'mujhe samajh nahi aayi'], ['How much is it?', 'یہ کتنے کا ہے؟', 'yeh kitne ka hai'], ['I am hungry', 'مجھے بھوک لگی ہے', 'mujhe bhook lagi hai']],
    'Grammar': [['I am', 'میں ہوں', 'main hoon'], ['You are', 'آپ ہیں', 'aap hain'], ['He is', 'وہ ہے', 'woh hai'], ['We are', 'ہم ہیں', 'hum hain'], ['I have', 'میرے پاس ہے', 'mere paas hai'], ['I want', 'مجھے چاہیے', 'mujhe chahiye']],
  }),
  "de": Lang("German", "🇩🇪", {
    "Greetings": [["Hello", "Hallo", "HAH-lo"], ["Good morning", "Guten Morgen", "GOO-ten MOR-gen"], ["Good night", "Gute Nacht", "GOO-teh nakht"], ["Goodbye", "Auf Wiedersehen", "owf VEE-der-zay-en"], ["Please", "Bitte", "BIT-teh"], ["Thank you", "Danke", "DAN-keh"]],
    "Food": [["Water", "Wasser", "VAH-ser"], ["Bread", "Brot", "broht"], ["Apple", "Apfel", "AHP-fel"], ["Milk", "Milch", "milkh"], ["Cheese", "Käse", "KAY-zeh"], ["Chicken", "Hähnchen", "HAYN-khen"]],
    "Numbers": [["One", "Eins", "eyents"], ["Two", "Zwei", "tsvy"], ["Three", "Drei", "dry"], ["Four", "Vier", "feer"], ["Five", "Fünf", "fuenf"], ["Ten", "Zehn", "tsayn"]],
    "Phrases": [["How are you?", "Wie geht's?", "vee GAYTS"], ["My name is...", "Ich heiße...", "ikh HY-seh"], ["Where is the bathroom?", "Wo ist die Toilette?", "voh ist dee toy-LET-teh"], ["I don't understand", "Ich verstehe nicht", "ikh fer-SHTAY-eh nikht"], ["How much is it?", "Wie viel kostet das?", "vee feel KOS-tet das"], ["I am hungry", "Ich habe Hunger", "ikh HAH-beh HOONG-er"]],
    "Grammar": [["I am", "Ich bin", "ikh bin"], ["You are", "Du bist", "doo bist"], ["He is", "Er ist", "air ist"], ["We are", "Wir sind", "veer zint"], ["I have", "Ich habe", "ikh HAH-beh"], ["I want", "Ich möchte", "ikh MURKH-teh"]],
  }),
  "it": Lang("Italian", "🇮🇹", {
    "Greetings": [["Hello", "Ciao", "CHOW"], ["Good morning", "Buongiorno", "bwon-JOR-no"], ["Good night", "Buonanotte", "bwo-na-NOT-teh"], ["Goodbye", "Arrivederci", "ar-ree-veh-DAIR-chee"], ["Please", "Per favore", "pair fah-VO-reh"], ["Thank you", "Grazie", "GRAH-tsyeh"]],
    "Food": [["Water", "Acqua", "AHK-kwah"], ["Bread", "Pane", "PAH-neh"], ["Apple", "Mela", "MEH-lah"], ["Milk", "Latte", "LAHT-teh"], ["Cheese", "Formaggio", "for-MAH-joh"], ["Chicken", "Pollo", "POL-lo"]],
    "Numbers": [["One", "Uno", "OO-no"], ["Two", "Due", "DOO-eh"], ["Three", "Tre", "treh"], ["Four", "Quattro", "KWAHT-tro"], ["Five", "Cinque", "CHEEN-kweh"], ["Ten", "Dieci", "DYEH-chee"]],
    "Phrases": [["How are you?", "Come stai?", "KO-meh sty"], ["My name is...", "Mi chiamo...", "mee KYAH-mo"], ["Where is the bathroom?", "Dov'è il bagno?", "do-VEH eel BAH-nyo"], ["I don't understand", "Non capisco", "non kah-PEES-ko"], ["How much is it?", "Quanto costa?", "KWAN-to KOS-tah"], ["I am hungry", "Ho fame", "oh FAH-meh"]],
    "Grammar": [["I am", "Io sono", "EE-o SO-no"], ["You are", "Tu sei", "too say"], ["He is", "Lui è", "LOO-ee eh"], ["We are", "Noi siamo", "noy SYAH-mo"], ["I have", "Io ho", "EE-o oh"], ["I want", "Io voglio", "EE-o VO-lyo"]],
  }),
  "pt": Lang("Portuguese", "🇧🇷", {
    "Greetings": [["Hello", "Olá", "o-LAH"], ["Good morning", "Bom dia", "bom DEE-ah"], ["Good night", "Boa noite", "BO-ah NOY-tcheh"], ["Goodbye", "Tchau", "chow"], ["Please", "Por favor", "por fah-VOR"], ["Thank you", "Obrigado", "o-bree-GAH-do"]],
    "Food": [["Water", "Água", "AH-gwah"], ["Bread", "Pão", "pown"], ["Apple", "Maçã", "mah-SAH"], ["Milk", "Leite", "LAY-tcheh"], ["Rice", "Arroz", "ah-HOZ"], ["Chicken", "Frango", "FRAHN-go"]],
    "Numbers": [["One", "Um", "oom"], ["Two", "Dois", "doys"], ["Three", "Três", "trehs"], ["Four", "Quatro", "KWAH-tro"], ["Five", "Cinco", "SEEN-ko"], ["Ten", "Dez", "dehs"]],
    "Phrases": [["How are you?", "Como vai você?", "KO-mo vy vo-SEH"], ["My name is...", "Meu nome é...", "meh-oo NO-meh eh"], ["Where is the bathroom?", "Onde fica o banheiro?", "ON-deh FEE-kah oo bah-NYAY-ro"], ["I don't understand", "Não entendo", "nown en-TEN-do"], ["How much is it?", "Quanto custa?", "KWAN-to KOOS-tah"], ["I am hungry", "Estou com fome", "es-TOH kom FO-meh"]],
    "Grammar": [["I am", "Eu sou", "eh-oo so"], ["You are", "Você é", "vo-SEH eh"], ["He is", "Ele é", "EH-leh eh"], ["We are", "Nós somos", "nohs SO-mos"], ["I have", "Eu tenho", "eh-oo TEN-yo"], ["I want", "Eu quero", "eh-oo KEH-ro"]],
  }),
  "ar": Lang("Arabic", "🇸🇦", {
    "Greetings": [["Hello", "مرحبا", "mar-HA-ban"], ["Good morning", "صباح الخير", "sabah al-khayr"], ["Good night", "تصبح على خير", "tusbih ala khayr"], ["Goodbye", "مع السلامة", "ma'a as-salama"], ["Please", "من فضلك", "min fadlak"], ["Thank you", "شكرا", "shukran"]],
    "Food": [["Water", "ماء", "maa"], ["Bread", "خبز", "khubz"], ["Apple", "تفاحة", "tuffaha"], ["Milk", "حليب", "haleeb"], ["Rice", "أرز", "aruzz"], ["Chicken", "دجاج", "dajaj"]],
    "Numbers": [["One", "واحد", "wahid"], ["Two", "اثنان", "ithnan"], ["Three", "ثلاثة", "thalatha"], ["Four", "أربعة", "arba'a"], ["Five", "خمسة", "khamsa"], ["Ten", "عشرة", "ashara"]],
    "Phrases": [["How are you?", "كيف حالك؟", "kayfa haluk"], ["My name is...", "اسمي ...", "ismi ..."], ["Where is the bathroom?", "أين الحمام؟", "ayna al-hammam"], ["I don't understand", "لا أفهم", "la afham"], ["How much is it?", "كم السعر؟", "kam as-si'r"], ["I am hungry", "أنا جائع", "ana ja'i'"]],
    "Grammar": [["I", "أنا", "ana"], ["You (male)", "أنت", "anta"], ["He", "هو", "huwa"], ["We", "نحن", "nahnu"], ["I have", "عندي", "indi"], ["I want", "أريد", "ureed"]],
  }),
  "hi": Lang("Hindi", "🇮🇳", {
    "Greetings": [["Hello", "नमस्ते", "namaste"], ["Good morning", "सुप्रभात", "suprabhat"], ["Good night", "शुभ रात्रि", "shubh ratri"], ["Goodbye", "अलविदा", "alvida"], ["Please", "कृपया", "kripaya"], ["Thank you", "धन्यवाद", "dhanyavaad"]],
    "Food": [["Water", "पानी", "paani"], ["Bread", "रोटी", "roti"], ["Apple", "सेब", "seb"], ["Milk", "दूध", "doodh"], ["Rice", "चावल", "chaaval"], ["Chicken", "मुर्गा", "murga"]],
    "Numbers": [["One", "एक", "ek"], ["Two", "दो", "do"], ["Three", "तीन", "teen"], ["Four", "चार", "chaar"], ["Five", "पाँच", "paanch"], ["Ten", "दस", "das"]],
    "Phrases": [["How are you?", "आप कैसे हैं?", "aap kaise hain"], ["My name is...", "मेरा नाम ... है", "mera naam ... hai"], ["Where is the bathroom?", "बाथरूम कहाँ है?", "bathroom kahaan hai"], ["I don't understand", "मुझे समझ नहीं आया", "mujhe samajh nahin aaya"], ["How much is it?", "यह कितने का है?", "yeh kitne ka hai"], ["I am hungry", "मुझे भूख लगी है", "mujhe bhookh lagi hai"]],
    "Grammar": [["I am", "मैं हूँ", "main hoon"], ["You are", "आप हैं", "aap hain"], ["He is", "वह है", "vah hai"], ["We are", "हम हैं", "hum hain"], ["I have", "मेरे पास है", "mere paas hai"], ["I want", "मुझे चाहिए", "mujhe chahiye"]],
  }),
  "tr": Lang("Turkish", "🇹🇷", {
    "Greetings": [["Hello", "Merhaba", "mer-ha-BA"], ["Good morning", "Günaydın", "gun-eye-DUN"], ["Good night", "İyi geceler", "ee-YEE ge-je-LER"], ["Goodbye", "Hoşça kal", "hosh-CHA kal"], ["Please", "Lütfen", "LUT-fen"], ["Thank you", "Teşekkürler", "te-shek-kur-LER"]],
    "Food": [["Water", "Su", "soo"], ["Bread", "Ekmek", "ek-MEK"], ["Apple", "Elma", "el-MA"], ["Milk", "Süt", "sut"], ["Cheese", "Peynir", "pay-NEER"], ["Chicken", "Tavuk", "ta-VUK"]],
    "Numbers": [["One", "Bir", "beer"], ["Two", "İki", "ee-KEE"], ["Three", "Üç", "uch"], ["Four", "Dört", "durt"], ["Five", "Beş", "besh"], ["Ten", "On", "on"]],
    "Phrases": [["How are you?", "Nasılsın?", "na-suhl-SUHN"], ["My name is...", "Benim adım...", "be-NEEM a-DUHM"], ["Where is the bathroom?", "Tuvalet nerede?", "too-va-LET ne-re-DE"], ["I don't understand", "Anlamıyorum", "an-la-muh-yo-RUM"], ["How much is it?", "Ne kadar?", "ne ka-DAR"], ["I am hungry", "Açım", "a-CHUHM"]],
    "Grammar": [["I am a student", "Ben öğrenciyim", "ben ur-ren-jee-YEEM"], ["You are a student", "Sen öğrencisin", "sen ur-ren-jee-SEEN"], ["He is a student", "O öğrenci", "o ur-ren-JEE"], ["We are students", "Biz öğrenciyiz", "beez ur-ren-jee-YEEZ"], ["I have", "Bende var", "ben-DE var"], ["I want", "İstiyorum", "is-tee-yo-RUM"]],
  }),
};
