#!/usr/bin/perl -w

use Test::More tests => 12;

use Business::Tax::Canada;

my $tax = Business::Tax::Canada->new;

{
	my $price = $tax->item(
		from => 'ab',
		to => 'ab',
		price => 120 );
	is $price->full, 127.2, "Full price correct - Alberta";
	is $price->gst, 7.2, "GST correct - Alberta";
	is $price->pst, 0, "No PST - Alberta";
	is $price->net, 120, "Net correct - Alberta";
	
}

{
	my $price = $tax->item(
		from => 'qc',
		to => 'qc',
		price => 120 );
	is $price->full, 136.74, "Full price correct - Quebec";
	is $price->gst, 7.2, "GST correct - Quebec";
	is $price->tvq, 9.54, "TVQ correct - Quebec";
	is $price->net, 120, "Net correct - Quebec";
}

{
	my $price = $tax->item(
		from => 'ns',
		to => 'nf',
		price => 120 );
	is $price->full, 136.8, "Full price correct - Nova Scotia";
	is $price->gst, 16.8, "GST correct, Nova Scotia";
	is $price->pst, 0, "No PST - Nova Scotia";
	is $price->net, 120, "Net correct - Nova Scotia";
}
