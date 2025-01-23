class PrayTime {
  final String prayName;
  final String prayTimeNumber;
  final String prayTime;

  const PrayTime({required this.prayName,required this.prayTimeNumber,required this.prayTime,});

 static List<PrayTime> getParyList()  => [
   PrayTime( prayName: 'Fagr', prayTimeNumber: '05:20',prayTime: 'AM'),
   PrayTime( prayName: 'Duhr', prayTimeNumber: '01:01',prayTime: 'PM'),
   PrayTime( prayName: 'Asr', prayTimeNumber: '04:38',prayTime: 'PM'),
   PrayTime( prayName: 'Maghrib', prayTimeNumber: '07:57',prayTime: 'PM'),
   PrayTime( prayName: 'Isha', prayTimeNumber: '09:00',prayTime: 'PM'),

   ];

}

