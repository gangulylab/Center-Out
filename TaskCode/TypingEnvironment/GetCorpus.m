function [ corpus ] = GetCorpus(varargin)
% [ corpus ] = GetCorpus(varargin)
%
% Extended description

p = inputParser;
p.addOptional('N', -1, @isnumeric)
parse(p, varargin{:});

N = p.Results.N;

full_corpus = {
    'the',
     'of',
     'and',
     'a',
     'to',
     'in',
     'is',
     'be',
     'that',
     'was',
     'he',
     'for',
     'it',
     'with',
     'as',
     'his',
     'I',
     'on',
     'have',
     'at',
     'by',
     'not',
     'they',
     'this',
     'had',
     'are',
     'but',
     'from',
     'or',
     'she',
     'an',
     'which',
     'you',
     'one',
     'we',
     'all',
     'were',
     'her',
     'would',
     'there',
     'their',
     'will',
     'when',
     'who',
     'him',
     'been',
     'has',
     'more',
     'if',
     'no',
     'out',
     'do',
     'so',
     'can',
     'what',
     'up',
     'said',
     'about',
     'other',
     'into',
     'than',
     'its',
     'time',
     'only',
     'could',
     'new',
     'them',
     'man',
     'some',
     'these',
     'then',
     'two',
     'first',
     'May',
     'any',
     'like',
     'now',
     'my',
     'such',
     'make',
     'over',
     'our',
     'even',
     'most',
     'me',
     'state',
     'after',
     'also',
     'made',
     'many',
     'did',
     'must',
     'before',
     'back',
     'see',
     'through',
     'way',
     'where',
     'get',
     'much',
     'go',
     'well',
     'your',
     'know',
     'should',
     'down',
     'work',
     'year',
     'because',
     'come',
     'people',
     'just',
     'say',
     'each',
     'those',
     'take',
     'day',
     'good',
     'how',
     'long',
     'Mr',
     'own',
     'too',
     'little',
     'use',
     'US',
     'very',
     'great',
     'still',
     'men',
     'here',
     'life',
     'both',
     'between',
     'old',
     'under',
     'last',
     'never',
     'place',
     'same',
     'another',
     'think',
     'house',
     'while',
     'high',
     'right',
     'might',
     'came',
     'off',
     'find',
     'states',
     'since',
     'used',
     'give',
     'against',
     'three',
     'himself',
     'look',
     'few',
     'general',
     'hand',
     'school',
     'part',
     'small',
     'American',
     'home',
     'during',
     'number',
     'again',
     'Mrs',
     'around',
     'thought',
     'went',
     'without',
     'however',
     'govern',
     'don''t',
     'does',
     'got',
     'public',
     'United',
     'point',
     'end',
     'become',
     'head',
     'once',
     'course',
     'fact',
     'upon',
     'need',
     'system',
     'set',
     'every',
     'war',
     'put',
     'form',
     'water',
     'took',
     'program',
     'present',
     'government',
     'thing',
     'told',
     'possible',
     'group',
     'large',
     'until',
     'always',
     'city',
     'didn''t',
     'order',
     'away',
     'called',
     'want',
     'eyes',
     'something',
     'unite',
     'going',
     'face',
     'far',
     'asked',
     'interest',
     'later',
     'show',
     'knew',
     'though',
     'less',
     'night',
     'early',
     'almost',
     'let',
     'open',
     'enough',
     'side',
     'case',
     'days',
     'yet',
     'better',
     'nothing',
     'tell',
     'problem',
     'toward',
     'given',
     'why',
     'national',
     'room',
     'young',
     'social',
     'light',
     'business',
     'president',
     'help',
     'power',
     'country',
     'next',
     'things',
     'word',
     'looked',
     'real',
     'John',
     'line',
     'second',
     'church',
     'seem',
     'certain',
     'big',
     'Four',
     'felt',
     'several',
     'children',
     'service',
     'feel',
     'important',
     'rather',
     'name',
     'per',
     'among',
     'often',
     'turn',
     'development',
     'keep',
     'family',
     'seemed',
     'white',
     'company',
     'mind',
     'members',
     'others',
     'within',
     'done',
     'along',
     'turned',
     'god',
     'sense',
     'week',
     'best',
     'change',
     'kind',
     'began',
     'child',
     'ever',
     'law',
     'matter',
     'least',
     'means',
     'question',
     'act',
     'close',
     'mean',
     'leave',
     'itself',
     'force',
     'study',
     'York',
     'action',
     'it''s',
     'door',
     'experience',
     'human',
     'result',
     'times',
     'run',
     'different',
     'car',
     'example',
     'hands',
     'whole',
     'center',
     'although',
     'call',
     'Five',
     'inform',
     'gave',
     'plan',
     'woman',
     'boy',
     'feet',
     'provide',
     'taken',
     'thus',
     'body',
     'play',
     'seen',
     'today',
     'having',
     'cost',
     'perhaps',
     'field',
     'local',
     'really',
     'am',
     'increase',
     'reason',
     'themselves',
     'clear',
     'I''m',
     'information',
     'figure',
     'late',
     'above',
     'history',
     'love',
     'girl',
     'held',
     'special',
     'move',
     'person',
     'whether',
     'college',
     'sure',
     'probably',
     'either',
     'seems',
     'cannot',
     'art',
     'free',
     'across',
     'death',
     'quite',
     'street',
     'value',
     'anything',
     'making',
     'past',
     'brought',
     'moment',
     'control',
     'office',
     'heard',
     'problems',
     'became',
     'full',
     'near',
     'half',
     'nature',
     'hold',
     'live',
     'available',
     'known',
     'board',
     'effect',
     'already',
     'Economic',
     'money',
     'position',
     'believe',
     'age',
     'together',
     'shall',
     'TRUE',
     'political',
     'court',
     'report',
     'level',
     'rate',
     'air',
     'pay',
     'community',
     'complete',
     'music',
     'necessary',
     'society',
     'behind',
     'type',
     'read',
     'idea',
     'wanted',
     'land',
     'party',
     'class',
     'organize',
     'return',
     'department',
     'education',
     'following',
     'mother',
     'sound',
     'ago',
     'nation',
     'voice',
     'six',
     'bring',
     'wife',
     'common',
     'south',
     'strong',
     'town',
     'book',
     'students',
     'hear',
     'hope',
     'able',
     'industry',
     'stand',
     'tax',
     'west',
     'meet',
     'particular',
     'cut',
     'short',
     'stood',
     'university',
     'spirit',
     'start',
     'total',
     'future',
     'front',
     'low',
     'century',
     'Washington',
     'usually',
     'care',
     'recent',
     'evidence',
     'further',
     'million',
     'simple',
     'road',
     'sometimes',
     'support',
     'view',
     'fire',
     'says',
     'hard',
     'morning',
     'table',
     'left',
     'situation',
     'try',
     'outside',
     'lines',
     'surface',
     'ask',
     'modern',
     'top',
     'peace',
     'personal',
     'member',
     'minutes',
     'lead',
     'schools',
     'talk',
     'consider',
     'gone',
     'soon',
     'father',
     'ground',
     'living',
     'months',
     'therefore',
     'America',
     'started',
     'longer',
     'Dr',
     'dark',
     'various',
     'finally',
     'hour',
     'north',
     'third',
     'fall',
     'greater',
     'pressure',
     'stage',
     'expected',
     'secretary',
     'needed',
     'That''s',
     'kept',
     'eye',
     'values',
     'union',
     'private',
     'alone',
     'black',
     'required',
     'space',
     'subject',
     'english',
     'month',
     'understand',
     'I''ll',
     'nor',
     'answer',
     'moved',
     'amount',
     'conditions',
     'direct',
     'red',
     'student',
     'rest',
     'nations',
     'heart',
     'costs',
     'record',
     'picture',
     'taking',
     'couldn''t',
     'hours',
     'deal',
     'forces',
     'everything',
     'write',
     'coming',
     'effort',
     'market',
     'island',
     'wall',
     'purpose',
     'basis',
     'east',
     'lost',
     'St',
     'except',
     'letter',
     'looking',
     'property',
     'Miles',
     'difference',
     'entire',
     'else',
     'color',
     'followed',
     'feeling',
     'son',
     'makes',
     'friend',
     'basic',
     'cold',
     'including',
     'single',
     'attention',
     'note',
     'cause',
     'hundred',
     'step',
     'paper',
     'developed',
     'tried',
     'simply',
     'can''t',
     'story',
     'committee',
     'inside',
     'reached',
     'easy',
     'appear',
     'include',
     'accord',
     'Actually',
     'remember',
     'beyond',
     'dead',
     'shown',
     'fine',
     'religious',
     'continue',
     'ten',
     'defense',
     'getting',
     'Central',
     'beginning',
     'instead',
     'river',
     'received',
     'doing',
     'employ',
     'trade',
     'terms',
     'trying',
     'friends',
     'sort',
     'administration',
     'higher',
     'cent',
     'expect',
     'food',
     'building',
     'religion',
     'meeting',
     'ready',
     'walked',
     'follow',
     'earth',
     'speak',
     'passed',
     'foreign',
     'NATURAL',
     'medical',
     'training',
     'County',
     'list',
     'floor',
     'piece',
     'especially',
     'indeed',
     'stop',
     'wasn''t',
     'England',
     'difficult',
     'likely',
     'Suddenly',
     'moral',
     'plant',
     'bad',
     'club',
     'needs',
     'international',
     'working',
     'countries',
     'develop',
     'drive',
     'reach',
     'police',
     'sat',
     'charge',
     'farm',
     'fear',
     'test',
     'determine',
     'hair',
     'results',
     'stock',
     'trouble',
     'happened',
     'growth',
     'square',
     'William',
     'cases',
     'effective',
     'serve',
     'miss',
     'involved',
     'doctor',
     'earlier',
     'increased',
     'being',
     'blue',
     'hall',
     'particularly',
     'boys',
     'paid',
     'sent',
     'production',
     'district',
     'using',
     'thinking',
     'concern',
     'Christian',
     'press',
     'girls',
     'wide',
     'usual',
     'direction',
     'feed',
     'trial',
     'walk',
     'begin',
     'weeks',
     'points',
     'respect',
     'certainly',
     'ideas',
     'industrial',
     'methods',
     'operation',
     'addition',
     'association',
     'combine',
     'knowledge',
     'decided',
     'temperature',
     'statement',
     'Yes',
     'below',
     'game',
     'nearly',
     'science',
     'directly',
     'horse',
     'influence',
     'size',
     'showed',
     'build',
     'throughout',
     'questions',
     'character',
     'foot',
     'Kennedy',
     'firm',
     'reading',
     'husband',
     'doubt',
     'services',
     'according',
     'lay',
     'stay',
     'programs',
     'anyone',
     'average',
     'French',
     'spring',
     'former',
     'summer',
     'bill',
     'lot',
     'chance',
     'due',
     'comes',
     'army',
     'actual',
     'Southern',
     'neither',
     'relate',
     'rise',
     'evening',
     'normal',
     'wish',
     'visit',
     'population',
     'remain',
     'measure',
     'merely',
     'arrange',
     'condition',
     'decision',
     'account',
     'opportunity',
     'pass',
     'demand',
     'strength',
     'window',
     'active',
     'deep',
     'degree',
     'ran',
     'western',
     'sales',
     'continued',
     'fight',
     'heavy',
     'arm',
     'standard',
     'generally',
     'carry',
     'hot',
     'provided',
     'serious',
     'led',
     'wait',
     'hotel',
     'opened',
     'performance',
     'maybe',
     'station',
     'changes',
     'literature',
     'marry',
     'claim',
     'works',
     'bed',
     'wrong',
     'main',
     'unit',
     'George',
     'hit',
     'planning',
     'supply',
     'systems',
     'add',
     'chief',
     'officer',
     'Soviet',
     'pattern',
     'stopped',
     'price',
     'success',
     'lack',
     'myself',
     'truth',
     'freedom',
     'manner',
     'quality',
     'gun',
     'manufacture',
     'clearly',
     'share',
     'movement',
     'length',
     'ways',
     'burn',
     'forms',
     'Organization',
     'break',
     'somewhat',
     'efforts',
     'cover',
     'meaning',
     'progress',
     'treatment',
     'beautiful',
     'placed',
     'happy',
     'attack',
     'apparently',
     'blood',
     'groups',
     'carried',
     'sign',
     'radio',
     'dance',
     'I''ve',
     'regard',
     'man''s',
     'train',
     'herself',
     'numbers',
     'corner',
     'REACTION',
     'immediately',
     'language',
     'running',
     'recently',
     'shake',
     'larger',
     'lower',
     'machine',
     'attempt',
     'learn',
     'couple',
     'race',
     'audience',
     'Oh',
     'middle',
     'brown',
     'date',
     'health',
     'persons',
     'understanding',
     'arms',
     'daily',
     'suppose',
     'additional',
     'hospital',
     'pool',
     'technical',
     'served',
     'declare',
     'described',
     'current',
     'poor',
     'steps',
     'reported',
     'sun',
     'based',
     'produce',
     'determined',
     'receive',
     'park',
     'staff',
     'faith',
     'responsibility',
     'Europe',
     'latter',
     'British',
     'season',
     'equal',
     'learned',
     'practice',
     'green',
     'writing',
     'ones',
     'choice',
     'fiscal',
     'term',
     'watch',
     'scene',
     'activity',
     'product',
     'types',
     'ball',
     'heat',
     'clothe',
     'lived',
     'distance',
     'parent',
     'letters',
     'returned',
     'forward',
     'obtained',
     'offer',
     'specific',
     'straight',
     'fix',
     'division',
     'slowly',
     'shot',
     'poet',
     'seven',
     'moving',
     'mass',
     'plane',
     'proper',
     'propose',
     'drink',
     'obviously',
     'plans',
     'whatever',
     'afternoon',
     'figures',
     'parts',
     'approve',
     'saying',
     'born',
     'immediate',
     'fame',
     'gives',
     'extent',
     'justice',
     'cars',
     'mark',
     'pretty',
     'opinion',
     'ahead',
     'glass',
     'refuse',
     'enter',
     'completely',
     'send',
     'desire',
     'judge',
     'none',
     'waiting',
     'popular',
     'Democratic',
     'film',
     'mouth',
     'Corps',
     'importance',
};

patient_corpus = {
    'I',
    'you',
    'my',
    'they',
    'it',
    'am',
    'are',
    'need',
    'feel',
    'is',
    'hungry',
    'help',
    'tired',
    'not',
    'how',
    'okay',
    'very',
    'thirsty',
    'comfortable',
    'right',
    'please',
    'hope',
    'clean',
    'glasses',
    'nurse',
    'closer',
    'bring',
    'what',
    'where',
    'tell',
    'that',
    'going',
    'music',
    'like',
    'outside',
    'do',
    'have',
    'faith',
    'success',
    'coming',
    'good',
    'bad',
    'here',
    'family',
    'hello',
    'goodbye',
    'computer',
    'yes',
    'up',
    'no',
    'friend',
    'today',
    'doing',
    'job',
};

n_patient_corpus = length(patient_corpus);
if N == -1
    N = length(full_corpus) + n_patient_corpus;
end
corpus = [patient_corpus; full_corpus];
corpus = unique(corpus, 'stable');
corpus = corpus(1:N);
end  % GetCorpus
