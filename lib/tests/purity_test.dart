import 'package:multitests/classes/test_class.dart';

const List<String> _possibleValues = [
  'Cool or running from the police',
  'A very fun person',
  'Try a little more',
  'Boring',
  'Child',
];

Test purityTest = Test(
  id: 'purity_test',
  version: '1.0.0',
  testName: 'Purity Test',
  testDescription: 'A simple bucket list',
  testDuration: const Duration(minutes: 10),
  testQuestions: const [
    TestQuestionsSimpleCategory(
      title: 'Romance',
      children: [
        TestQuestionCheck(question: 'Held hands romantically?'),
        TestQuestionCheck(question: 'Been on a date?'),
        TestQuestionCheck(question: 'Had a date past 1 a.m.?'),
        TestQuestionCheck(question: 'Been in a relationship?'),
        TestQuestionCheck(question: 'Picked someone up?'),
        TestQuestionCheck(question: 'Been picked up?'),
        TestQuestionCheck(question: 'Kissed on the lips?'),
        TestQuestionCheck(question: 'French kissed?'),
        TestQuestionCheck(question: 'French kissed in public?'),
        TestQuestionCheck(question: 'Kissed on the neck?'),
        TestQuestionCheck(question: 'Given or received a hickey?'),
        TestQuestionCheck(question: 'Kissed or been kissed on the breast?'),
        TestQuestionCheck(
            question:
                'Kissed someone below the belt? (like legs or near genitals, for genitals see oral sex)'),
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
            TestQuestionCheck(question: 'Played a game involving stripping?'),
            TestQuestionCheck(
                question: 'Ingested alcohol in a non-religious context?'),
            TestQuestionCheck(question: 'Played a drinking game?'),
            TestQuestionCheck(
                question:
                    'Been attached to a bottle of alcohol? (maybe with a hat on it)'),
            TestQuestionCheck(question: 'Been drunk?'),
            TestQuestionCheck(
                question: 'Faked sobriety to parents or teachers?'),
            TestQuestionCheck(
                question: 'Had severe memory loss due to alcohol?'),
            TestQuestionCheck(question: 'Used tobacco?'),
            TestQuestionCheck(question: 'Used marijuana?'),
            TestQuestionCheck(question: 'Used a drug stronger than marijuana?'),
            TestQuestionCheck(question: 'Used a gun for fun?'),
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
            TestQuestionCheck(question: 'Plagiarized?'),
            TestQuestionCheck(question: 'Shoplifted/stolen?'),
            TestQuestionCheck(
                question: 'Lied that you love someone for personal gains?'),
            TestQuestionCheck(question: 'Farted on someone?'),
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
            TestQuestionCheck(
                question: 'Masturbated while in a moving vehicle?'),
            TestQuestionCheck(
                question:
                    "Ever had a subscription to pornographic websites?(Free trials don't count)"),
          ],
        ),
      ],
    ),
    TestQuestionsSimpleCategory(
      title: 'Sexual',
      children: [
        TestQuestionCheck(question: 'Massaged or been massaged sensually?'),
        TestQuestionCheck(question: 'Fondled or had your butt cheeks fondled?'),
        TestQuestionCheck(question: 'Fondled or had your breasts fondled?'),
        TestQuestionCheck(question: 'Fondled or had your genitals fondled?'),
        TestQuestionCheck(
            question:
                'Seen or been seen by another person in a sensual context?'),
        TestQuestionCheck(
            question:
                'Undressed or been undressed by a MPS (member of the preferred sex)?'),
        TestQuestionCheck(
            question: 'Sent or received sexually explicit photographs?'),
        TestQuestionCheck(
            question: 'Engaged in sexually explicit activity over video chat?'),
        TestQuestionCheck(question: 'Slept(actual sleeping) with a MPS?'),
        TestQuestionCheck(question: 'Purchased contraceptives?'),
        TestQuestionCheck(question: 'Showered with a MPS?'),
        TestQuestionCheck(question: 'Gave oral sex?'),
        TestQuestionCheck(question: 'Received oral sex?'),
        TestQuestionCheck(question: 'Used a sex toy with a partner?'),
        TestQuestionCheck(
            question: 'Been walked in on while engaging in a sexual act?'),
        TestQuestionCheck(
            question:
                'Kicked a parent/friend/roommate out to commit a sexual act?'),
        TestQuestionCheck(question: 'Had or given “blue balls”?'),
        TestQuestionCheck(question: 'Had an orgasm thanks to someone else?'),
        TestQuestionCheck(question: 'Had sexual intercourse?'),
        TestQuestionCheck(
            question:
                'Had sexual intercourse three or more times in one night?'),
        TestQuestionCheck(
            question: 'Had sexual intercourse in four or more positions?'),
        TestQuestionCheck(
            question:
                'Had sexual intercourse with a stranger or person you met within 24 hours?'),
        TestQuestionCheck(
            question:
                'Had sexual intercourse with two or more people at once?'),
        TestQuestionCheck(
            question:
                'Had two or more distinct acts of sexual intercourse with two or more people within 24 hours?'),
        TestQuestionCheck(question: 'Had sexual intercourse in a vehicle?'),
        TestQuestionCheck(
            question:
                'Had sexual intercourse in a moving vehicle? (for planes see mile high club)'),
        TestQuestionCheck(question: 'Had sexual intercourse outdoors?'),
        TestQuestionCheck(
            question: 'Had sexual intercourse in a swimming pool or hot tub?'),
        TestQuestionCheck(
            question:
                "Had sexual intercourse while you or your partner's parents were in the same home?"),
        TestQuestionCheck(question: 'Had sexual intercourse with spectators?'),
        TestQuestionCheck(
            question:
                'Had sexual intercourse with a partner with a 3 or more year age difference?'),
        TestQuestionCheck(question: 'Had sexual intercourse with a virgin?'),
        TestQuestionCheck(question: 'Had sexual intercourse without a condom?'),
        TestQuestionCheck(
            question: 'Had a STI test due to reasonable suspicion?'),
        TestQuestionCheck(question: 'Had a STI?'),
        TestQuestionCheck(question: 'Had period sex?'),
        TestQuestionCheck(question: 'Had anal sex?'),
        TestQuestionCheck(question: '69?'),
        TestQuestionCheck(
            question: 'Joined the mile high club? (Respect gainer)'),
        TestQuestionCheck(question: 'Attended an orgy?'),
        TestQuestionCheck(
            question:
                'Traveled 100 or more kilometers for the primary purpose of sexual intercourse?'),
        TestQuestionCheck(
            question:
                'Been photographed or filmed during sexual intercourse by yourself or others?'),
        TestQuestionCheck(question: 'Impregnated someone or been impregnated?'),
        TestQuestionCheck(question: 'Paid or been paid for a sexual act?'),
        TestQuestionCheck(
            question: 'Committed an act of voyeurism? (You creep)'),
        TestQuestionCheck(question: 'Committed an act of incest?'),
      ],
    ),
    TestQuestionsSimpleCategory(
      title: 'Really bad (I hope this will not be checked)',
      children: [
        TestQuestionCheck(question: 'Physically hurt someone?'),
        TestQuestionCheck(
            question: 'Killed someone without an ethical reason?'),
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
    'Do this test ONLY IF YOU HAVE AT LEAST 16 YEARS',
    'Click on every item you have done.',
    'Take your time, and answer truthfully!',
    'MPS stands for Member of the Preferred Sex.',
    "Don't take the description for real. Completion of all items on this test will likely result in death or prison.",
  ],
  testResultDescriber: const TestResultDescriber(
    minValue: 0,
    maxValue: 100,
    possibleValues: _possibleValues,
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
    String purityLabel = _possibleValues[(100 - did) ~/ 25];
    return TestResult(
      'Your Purity Level',
      resultValue: 100 - did,
      resultType: TestResultType(purityLabel, null),
    );
  },
);
