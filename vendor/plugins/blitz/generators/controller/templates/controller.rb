class <%= class_name %>Controller < ApplicationController
  <% if actions.include? "index" %>
  def index
    @<%= class_name.downcase.pluralize %> = <%= class_name.singularize %>.all
  end

  <% if actions.include? "show" %>
  def show
    @<%= class_name.downcase.singularize %> = <% class_name.singularize %>.find(params[:id])
  end
  <% end %>

  <% end %>
  <% if actions.include? "new" %>
  def new
    @<%= class_name.downcase.singularize %> = <%= class_name.singularize %>.new
  end

  <% end %>
  <% if actions.include? "create" %>
  def create
    @<%= class_name.downcase.singularize %> = <% class_name.singularize %>.new(params[:<%= class_name.downcase.singularize %>])
    if @<%= class_name.downcase.singularize %>.save
      flash[:notice] = "<%= class_name.singularize %> was successfully created."
      redirect_to @%<= class_name.downcase.singularize %>
    else
      render :action => :new
    end
  end

  <% end %>
  <% if actions.include? "edit" %>
  def edit
    @<%= class_name.downcase.singularize %> = <% class_name.singularize %>.find(params[:id])
  end

  <% end %>
  <% if actions.include? "update" %>
  def update
    @<%= class_name.downcase.singularize %> = <% class_name.singularize %>.find(params[:id])
    if @<%= class_name.downcase.singularize %>.update_attributes(params[:<%= class_name.downcase.singularize %>])
      flash[:notice] = "<%= class_name.singularize %> was successfully updated."
      redirect_to @%<= class_name.downcase.singularize %>
    else
      render :action => :edit
    end
  end

  <% end %>
  <% if actions.include? "destroy" %>
  def destroy
    <%= class_name.downcase.singularize %> = <%= class_name.singularize %>.find(params[:id])
    <%= class_name.downcase.singularize %>.destroy
    flash[:notice] = "<%= class_name.singularize %> was successfully destroyed."
    redirect_to root_url
  end
  <% end %>
end
