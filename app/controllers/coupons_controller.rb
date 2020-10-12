class CouponsController < ApplicationController
    #auto defines 7 paths for me
    # GET /coupons = coupons#index
    # GET /coupons/new = coupons#new (shows form)
    # POST /coupons = coupons#create (accepts form)
    # GET /coupons/:id = coupons#show
    # GET /coupons/:id/edit = coupons#edit (shows form)
    # PATCH/PUT /coupons/:id = coupons#update (accepts form)

    ###############################
    # these URL paths+method combos still need to be defined if I want to pass data between them
    ###############################
    ### CouponsController is what makes the methods
    ####### resources :coupons is what defines the paths, substituting the name in 7 CRUD paths..."/photos"
    ####### (perhaps also defines method but needs Controller to pass to?)

    # always put /coupons/:id BELOW /coupons/<anything>
    # note: the singular added path. otherwise :id will grab it first.

    def index
        @coupons = Coupon.all
    end
    
    def show # is the method for when someone hits /coupons/:id
        @coupon = Coupon.find(params[:id])
    end

    def create
        @coupon = Coupon.new
        @coupon.coupon_code = params[:coupon][:coupon_code]
        @coupon.store = params[:coupon][:store]

        @coupon.save


        redirect_to coupon_path(@coupon)
    end
end
