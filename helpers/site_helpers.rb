module SiteHelpers

  def page_title
    title = "Project Name"
    if data.page.title
      title << " | " + data.page.title
    end
    title
  end

  def page_description
    if data.page.description
      data.page.description
    else
      "Site Description"
    end
  end

  def nav(curr)
    if data.page.module
      "active"
    else
      ""
    end
  end

end