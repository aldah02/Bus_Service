import '../models/agency.dart';

class AgencyProvider {
  final List<Agency> _agencies = [
    Agency(agencyId: 'GMS', dailyPrice: 4.0, weeklyPrice: 8.0),
    Agency(agencyId: 'HTL', dailyPrice: 3.0, weeklyPrice: 9.0),
  ];

  Agency? getAgencyById(String agencyId) {
    return _agencies.firstWhere(
      (agency) => agency.agencyId == agencyId,
      orElse: () => Agency(
          agencyId: '',
          dailyPrice: 0.0,
          weeklyPrice: 0.0), // Return a default Agency
    );
  }

  List<Agency> getAllAgencies() {
    return _agencies;
  }
}
