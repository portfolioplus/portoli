import 'package:intl/intl.dart';

class ChartItem {
  final String group;
  final double val;

  ChartItem(this.group, this.val);

  @override
  String toString() {
    final formatPercent = NumberFormat.percentPattern();
    return formatPercent.format(val);
  }

}

class ChartItemCurrency extends ChartItem{
  final String currency;
  ChartItemCurrency(this.currency, group, double val) : super(group, val);

  @override
  String toString(){
    final formatCurrency = NumberFormat.currency(symbol: currency);
    
    return formatCurrency.format(val);
  } 
}
