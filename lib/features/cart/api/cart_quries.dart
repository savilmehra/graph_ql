String getCartDetailsQuery(String cartId) {
  return '''
  {
	cart(cart_id: "$cartId") {
	  $cartOutput
	}
}
''';
}

String cartOutput = '''
	  id
		email
		total_quantity
		billing_address {
			city
			country {
				code
				label
			}
			firstname
			lastname
			postcode
			region {
				code
				label
			}
			street
			telephone
		}
		shipping_addresses {
			firstname
			lastname
			street
			city
			postcode
			region {
				code
				label
			}
			country {
				code
				label
			}
			telephone
			available_shipping_methods {
				amount {
					currency
					value
				}
				available
				carrier_code
				carrier_title
				error_message
				method_code
				method_title
				price_excl_tax {
					value
					currency
				}
				price_incl_tax {
					value
					currency
				}
			}
			selected_shipping_method {
				amount {
					value
					currency
				}
				carrier_code
				carrier_title
				method_code
				method_title
			}
		}
		items {
			id
			errors {
				message
			}
				prices{
					price{
						currency
						value
					}
						discounts{
							amount{
								currency
								value
							}
							label
						}
				}
			product {
				name
				sku
				image{
					url
				}
				stock_status
				__typename
				price_range{
					minimum_price{
						regular_price{
							currency
							value
						}
						discount{
							amount_off
							percent_off
						}
						final_price{
							currency
							value
						}
					}
					maximum_price{
							regular_price{
							currency
							value
						}
						discount{
							amount_off
							percent_off
						}
						final_price{
							currency
							value
						}
					}
				}
			}
			quantity
			... on BundleCartItem{
				bundle_options{
					label
					uid
					values{
					  uid
						label
						price
						quantity
					}
				}
			}
			
			... on GiftCardCartItem{
				amount{
					currency
					value
				}
				message
				sender_name
				sender_email
				recipient_name
				recipient_email
			}
		}
		available_payment_methods {
			code
			title
		}
		applied_coupons {
			code
		}
		applied_gift_cards {
			code
			current_balance {
				value
			}
			applied_balance {
				value
			}
		}
		prices {
			discounts{
				amount{
					currency
					value
				}
			}
			subtotal_including_tax{
				currency
				value
			}
			subtotal_excluding_tax{
				currency
				value
			}
			subtotal_with_discount_excluding_tax{
				currency
				value
			}
			grand_total {
				value
				currency
			}
		}
''';
