def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
#  pp collection
  index = 0
  result = {}
  while index < collection.length do
    if(collection[index][:item] == name)
      result = collection[index]
      break
    else
      result = nil
    end
    index+=1
  end
  return result
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
#  pp cart
  array = []
  index = 0
  while index < cart.length do
    if(array.length == 0)
      hash_new = cart[index]
      hash_new[:count] = 1
      array << hash_new
    else
      array_index = 0
      itemfound=0
      while array_index < array.length do
        if(array[array_index][:item] == cart[index][:item])
          array[array_index][:count] += 1
          itemfound=1
          break
        end
        array_index+=1
      end
      if(itemfound==0)
        hash_new = cart[index]
        hash_new[:count] = 1
        array << hash_new
      end
    end
    index+=1
  end
  return array
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart_index = 0
  coupon_index = 0
  while cart_index < cart.length do
    while coupon_index < coupon.length do
      if(cart[cart_index][:item] == coupon[coupon_index][:item])
        if(cart[cart_index][:count]>=coupon[coupon_index][:num])
          #cart update
          new_count = cart[cart_index][:count] - coupon[coupon_index][:num]
          cart[cart_index][:count] = new_count
          #add coupon item
          hash_new={}
          new_item = "#{cart[cart_index][:item]} W/COUPON"
          hash_new[:item] = new_item
          price = coupon[coupon_index][:cost]/coupon[coupon_index][:num]
          hash_new[:price] = price
          clearance = cart[cart_index][:clearance]
          hash_new[:clearance] = clearance
          count = coupon[coupon_index][:num]
          hash_new[:count] = count
          cart << hash_new
        end
        break
      end
      coupon_index+=1
    end
    cart_index+=1
  end
  return cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
