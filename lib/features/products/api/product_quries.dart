String searchQuery() {
  return '''
{
	products(
	filter:{}
	search:"tv"
		pageSize: 10
		currentPage: 1
		sort: { relevance:DESC }
	) {
		items {
			id
			sku
			name
			url_key
			stock_status
			__typename
			image {
				url
				label
				position
			}
			small_image {
				url
				label
				position
			}
			thumbnail {
				url
				label
				position
			}
			... on BundleProduct {
				items {
	option_id
	uid
	title
	sku
	type
	required
	position
	options {
		id
		uid
		label
		quantity
		can_change_quantity
		is_default
		position
		price
		price_type
		product {
			uid
			id
			name
			sku
			stock_status
			price_range {
				minimum_price {
					final_price {
						value
						currency
					}
					discount {
						amount_off
						percent_off
					}
					regular_price {
						value
						currency
					}
				}
				maximum_price {
					final_price {
						value
						currency
					}
					discount {
						amount_off
						percent_off
					}
					regular_price {
						value
						currency
					}
				}
			}
		}
	}
}

			}
			price_range {
				minimum_price {
					regular_price {
						value
						currency
					}
					final_price {
						value
						currency
					}
					discount{
						amount_off
						percent_off
					}
				}
				maximum_price {
					regular_price {
						value
						currency
					}
					final_price {
						value
						currency
					}
					discount{
						amount_off
						percent_off
					}
				}
			}
			special_price
			special_to_date
			special_from_date
			price_tiers {
				quantity
				final_price {
					value
					currency
				}
				discount {
					amount_off
					percent_off
				}
			}
		}
		total_count
		aggregations {
			attribute_code
			label
			count
			options {
				count
				label
				value
			}
		}

		page_info {
			page_size
		}
	}
}
''';
}