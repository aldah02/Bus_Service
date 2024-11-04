import 'models/agency.dart';
import 'services/agency_provider.dart';
import 'services/pricing_calculator.dart';

void main() {
  final agencyProvider = AgencyProvider();
  final pricingCalculator = PricingCalculator(agencyProvider);

  int commutingDays = 5;

  // Find cheapest ticket option for a specific agency
  String agencyId = 'GMS';
  var option =
      pricingCalculator.findCheapestTicketOption(agencyId, commutingDays);
  if (option != null) {
    print(
        'Best ticket option for $agencyId: ${option['ticketType']} ticket, Price: £${option['price']}');
  }

  // Find cheapest ticket option across all agencies
  var cheapestOption =
      pricingCalculator.findCheapestOptionAcrossAgencies(commutingDays);
  if (cheapestOption != null) {
    print('Cheapest option across all agencies:');
    print('Agency ID: ${cheapestOption['agencyId']}');
    print('Ticket Type: ${cheapestOption['ticketType']}');
    print('Price: £${cheapestOption['price']}');
  }
}
