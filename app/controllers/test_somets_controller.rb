class TestSometsController < ApplicationController
  def index
    @test_somets = TestSomet.page(params[:page]).per(10)

    render("test_somets/index.html.erb")
  end

  def show
    @test_somet = TestSomet.find(params[:id])

    render("test_somets/show.html.erb")
  end

  def new
    @test_somet = TestSomet.new

    render("test_somets/new.html.erb")
  end

  def create
    @test_somet = TestSomet.new

    @test_somet.name = params[:name]
    @test_somet.etc = params[:etc]

    save_status = @test_somet.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/test_somets/new", "/create_test_somet"
        redirect_to("/test_somets")
      else
        redirect_back(:fallback_location => "/", :notice => "Test somet created successfully.")
      end
    else
      render("test_somets/new.html.erb")
    end
  end

  def edit
    @test_somet = TestSomet.find(params[:id])

    render("test_somets/edit.html.erb")
  end

  def update
    @test_somet = TestSomet.find(params[:id])

    @test_somet.name = params[:name]
    @test_somet.etc = params[:etc]

    save_status = @test_somet.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/test_somets/#{@test_somet.id}/edit", "/update_test_somet"
        redirect_to("/test_somets/#{@test_somet.id}", :notice => "Test somet updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Test somet updated successfully.")
      end
    else
      render("test_somets/edit.html.erb")
    end
  end

  def destroy
    @test_somet = TestSomet.find(params[:id])

    @test_somet.destroy

    if URI(request.referer).path == "/test_somets/#{@test_somet.id}"
      redirect_to("/", :notice => "Test somet deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Test somet deleted.")
    end
  end
end
