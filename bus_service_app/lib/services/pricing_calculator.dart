import '../models/agency.dart';
import 'agency_provider.dart';

class PricingCalculator {
  final AgencyProvider agencyProvider;

  PricingCalculator(this.agencyProvider);

  double calculateDailyCost(double dailyPrice, int commutingDays) {
    return dailyPrice * commutingDays;
  }

  Map<String, dynamic>? findCheapestTicketOption(String agencyId, int commutingDays) {
    Agency? agency = agencyProvider.getAgencyById(agencyId);
    if (agency == null) return null;

    double dailyCost = calculateDailyCost(agency.dailyPrice, commutingDays);
    double weeklyCost = agency.weeklyPrice;

    String bestOption = dailyCost < weeklyCost ? 'daily' : 'weekly';
    double bestPrice = dailyCost < weeklyCost ? dailyCost : weeklyCost;

    return {
      'ticketType': bestOption,
      'price': bestPrice,
    };
  }

  Map<String, dynamic>? findCheapestOptionAcrossAgencies(int commutingDays) {
    Agency? bestAgency;
    String bestTicketType = '';
    double bestPrice = double.infinity;

    List<Agency> agencies = agencyProvider.getAllAgencies();

    for (var agency in agencies) {
      var option = findCheapestTicketOption(agency.agencyId, commutingDays);
      if (option != null && option['price'] < bestPrice) {
        bestAgency = agency;
        bestTicketType = option['ticketType'];
        bestPrice = option['price'];
      }
    }

    if (bestAgency == null) return null;

    return {
      'agencyId': bestAgency.agencyId,
      'ticketType': bestTicketType,
      'price': bestPrice,
    };
  }
}
