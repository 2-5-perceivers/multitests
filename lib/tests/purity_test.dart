import 'package:multitests/classes/test_class.dart';

/* FUN

*/

Test purityTest = Test(
  id: 'purity_test',
  version: '0.2.0',
  testName: 'Purity Test',
  testDescription: 'A simple bucket list',
  testDuration: const Duration(minutes: 20),
  testQuestions: const [
    TestQuestionsSimpleCategory(
      title: 'Romance',
      children: [
        TestQuestionCheck(question: 'Held hands romantically?'),
        TestQuestionCheck(question: 'Been on a date?'),
        TestQuestionCheck(question: 'Been in a relationship?'),
        TestQuestionCheck(question: 'Kissed a non-family member?'),
        TestQuestionCheck(question: 'Kissed a non-family member on the lips?'),
        TestQuestionCheck(question: 'French kissed?'),
        TestQuestionCheck(question: 'French kissed in public?'),
        TestQuestionCheck(question: 'Kissed on the neck?'),
        TestQuestionCheck(question: 'Kissed horizontally?'),
        TestQuestionCheck(question: 'Given or received a hickey?'),
        TestQuestionCheck(question: 'Kissed or been kissed on the breast?'),
        TestQuestionCheck(question: 'Kissed someone below the belt?'),
        TestQuestionCheck(
          question: 'Kissed for more than two hours consecutively?',
        ),
        TestQuestionCheck(
          question: 'Cheated on a significant other during a relationship?',
        ),
      ],
    ),
    TestQuestionsCategoryOfCategories(
      title: null,
      children: [
        TestQuestionsSimpleCategory(
          title: 'Fun',
          children: [
            TestQuestionCheck(
                question: 'Danced without leaving room for Jesus?'),
            TestQuestionCheck(question: 'Played a game involving stripping?'),
            TestQuestionCheck(
                question: 'Ingested alcohol in a non-religious context?'),
            TestQuestionCheck(question: 'Played a drinking game?'),
            TestQuestionCheck(question: 'Been drunk?'),
            TestQuestionCheck(
                question: 'Faked sobriety to parents or teachers?'),
            TestQuestionCheck(
                question: 'Had severe memory loss due to alcohol?'),
            TestQuestionCheck(question: 'Used tobacco?'),
            TestQuestionCheck(question: 'Used marijuana?'),
            TestQuestionCheck(question: 'Used a drug stronger than marijuana?'),
            TestQuestionCheck(
                question:
                    'Used methamphetamine, crack cocaine, PCP, horse tranquilizers or heroin?'),
            TestQuestionCheck(
                question:
                    'Been sent to the office of a principal, dean or judicial affairs representative for a disciplinary infraction?'),
            TestQuestionCheck(
                question: 'Been put on disciplinary probation or suspended?'),
            TestQuestionCheck(question: 'Urinated in public?'),
            TestQuestionCheck(question: 'Gone skinny-dipping?'),
            TestQuestionCheck(question: 'Gone streaking?'),
            TestQuestionCheck(question: 'Seen a stripper?'),
            TestQuestionCheck(question: 'Had the police called on you?'),
            TestQuestionCheck(question: 'Run from the police?'),
            TestQuestionCheck(question: 'Had the police question you?'),
            TestQuestionCheck(question: 'Had the police handcuff you?'),
            TestQuestionCheck(question: 'Been arrested?'),
            TestQuestionCheck(question: 'Been convicted of a crime?'),
            TestQuestionCheck(question: 'Been convicted of a felony?'),
            TestQuestionCheck(question: 'Committed an act of vandalism?'),
          ],
        ),
        TestQuestionsSimpleCategory(
          title: 'Self pleasure',
          children: [
            TestQuestionCheck(question: 'Masturbated?'),
            TestQuestionCheck(question: 'Masturbated to a picture or video?'),
            TestQuestionCheck(
                question: 'Masturbated while someone else was in the room?'),
            TestQuestionCheck(question: 'Been caught masturbating?'),
            TestQuestionCheck(
                question: 'Masturbated with an inanimate object?'),
            TestQuestionCheck(question: 'Seen or read pornographic material?'),
          ],
        ),
      ],
    ),
    TestQuestionsSimpleCategory(
      title: 'Sexual',
      children: [
        TestQuestionCheck(
            question:
                'Seen or been seen by another person in a sensual context?'),
        TestQuestionCheck(question: 'Massaged or been massaged sensually?'),
        TestQuestionCheck(
            question:
                'Gone through the motions of intercourse while fully dressed?'),
        TestQuestionCheck(
            question:
                'Undressed or been undressed by a MPS (member of the preferred sex)?'),
        TestQuestionCheck(question: 'Showered with a MPS?'),
        TestQuestionCheck(question: 'Fondled or had your butt cheeks fondled?'),
        TestQuestionCheck(question: 'Fondled or had your breasts fondled?'),
        TestQuestionCheck(question: 'Fondled or had your genitals fondled?'),
        TestQuestionCheck(question: 'Had or given “blue balls”?'),
        TestQuestionCheck(
            question: "Had an orgasm due to someone else's manipulation?"),
        TestQuestionCheck(
            question: 'Sent a sexually explicit text or instant message?'),
        TestQuestionCheck(
            question: 'Sent or received sexually explicit photographs?'),
        TestQuestionCheck(
            question: 'Engaged in sexually explicit activity over video chat?'),
        TestQuestionCheck(question: 'Purchased contraceptives?'),
        TestQuestionCheck(question: 'Gave oral sex?'),
        TestQuestionCheck(question: 'Received oral sex?'),
        TestQuestionCheck(
            question: "Ingested someone else's genital secretion?"),
        TestQuestionCheck(question: 'Used a sex toy with a partner?'),
        TestQuestionCheck(question: 'Spent the night with a MPS?'),
        TestQuestionCheck(
            question: 'Been walked in on while engaging in a sexual act?'),
        TestQuestionCheck(
            question: 'Kicked a roommate out to commit a sexual act?'),
        TestQuestionCheck(question: 'Had sexual intercourse?'),
        TestQuestionCheck(
            question:
                'Had sexual intercourse three or more times in one night?'),
        TestQuestionCheck(question: '69?'),
        TestQuestionCheck(question: 'Had sexual intercourse 10 or more times?'),
        TestQuestionCheck(
            question: 'Had sexual intercourse in four or more positions?'),
        TestQuestionCheck(
            question:
                'Had sexual intercourse with a stranger or person you met within 24 hours?'),
        TestQuestionCheck(
            question: 'Had sexual intercourse in a motor vehicle?'),
        TestQuestionCheck(question: 'Had sexual intercourse outdoors?'),
        TestQuestionCheck(question: 'Had sexual intercourse in public?'),
        TestQuestionCheck(
            question: 'Had sexual intercourse in a swimming pool or hot tub?'),
        TestQuestionCheck(
            question:
                'Had sexual intercourse in a bed not belonging to you or your partner?'),
        TestQuestionCheck(
            question:
                'Had sexual intercourse while you or your partner’s parents were in the same home?'),
        TestQuestionCheck(
            question:
                'Had sexual intercourse with non-participating third party in the same room?'),
        TestQuestionCheck(
            question: 'Joined the mile high club? (Respect gainer)'),
        TestQuestionCheck(
            question:
                'Participated in a “booty call” with a partner whom you were not in a relationship with?'),
        TestQuestionCheck(
            question:
                'Traveled 100 or more miles for the primary purpose of sexual intercourse?'),
        TestQuestionCheck(
            question:
                'Had sexual intercourse with a partner with a 3 or more year age difference?'),
        TestQuestionCheck(question: 'Had sexual intercourse with a virgin?'),
        TestQuestionCheck(question: 'Had sexual intercourse without a condom?'),
        TestQuestionCheck(
            question: 'Had a STI test due to reasonable suspicion?'),
        TestQuestionCheck(question: 'Had a STI?'),
        TestQuestionCheck(question: 'Had a threesome?'),
        TestQuestionCheck(question: 'Attended an orgy?'),
        TestQuestionCheck(
            question:
                'Had two or more distinct acts of sexual intercourse with two or more people within 24 hours?'),
        TestQuestionCheck(
            question: 'Had sexual intercourse with five or more partners?'),
        TestQuestionCheck(
            question:
                'Been photographed or filmed during sexual intercourse by yourself or others?'),
        TestQuestionCheck(question: 'Had period sex?'),
        TestQuestionCheck(question: 'Had anal sex?'),
        TestQuestionCheck(question: 'Had a pregnancy scare?'),
        TestQuestionCheck(question: 'Impregnated someone or been impregnated?'),
        TestQuestionCheck(question: 'Paid or been paid for a sexual act?'),
        TestQuestionCheck(question: 'Committed an act of voyeurism?'),
        TestQuestionCheck(question: 'Committed an act of incest?'),
        TestQuestionCheck(question: 'Engaged in bestiality?'),
      ],
    ),
  ],
  testCategories: [
    TestCategory.explicit,
    TestCategory.maturity,
    TestCategory.nonScientific,
  ],
  testDataCollections: [],
  testSuggestions: [
    'Answer as honestly as possible',
  ],
  testResultDescriber: const TestResultDescriber(
    minValue: 0,
    maxValue: 100,
    possibleValues: [
      '911? Yes we got him',
      "Let's gooo",
      'Try a little more',
      'Boring',
      'I assume you are a child',
    ],
  ),
  resultCalculator: (responseMap) {
    int did = 0;
    responseMap.forEach(
      (key, value) {
        if (value == true) {
          did++;
        }
      },
    );
    String purityLabel = <int, String>{
          0: '911? Yes we got him',
          1: "Let's gooo",
          2: 'Try a little more',
          3: 'Boring',
          4: 'I assume you are a child',
        }[(100 - did) ~/ 25] ??
        '';
    return TestResult(
      'Your Purity Level',
      resultValue: 100 - did,
      resultType: TestResultType(purityLabel, null),
    );
  },
);
