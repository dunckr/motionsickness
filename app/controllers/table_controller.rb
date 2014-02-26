class TableController < UITableViewController

  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle 'TABLE', image:nil, tag:1
    end
    self
  end

  def viewDidLoad
    super
    @options = [
      "WE",
      "HAVE",
      "LOTS",
      "OF",
      "THINGS",
      "TO",
      "TEST"
    ]
    self.title = "Social"
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @options.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:nil).tap do |cell|
      cell.textLabel.text = @options[indexPath.row]
      cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton
      cell
    end
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    @subview_controller ||= SubviewController.alloc.init
    @subview_controller.detail @options[indexPath.row]
    self.navigationController.pushViewController(@subview_controller, animated:true)
  end

  def tableView(tableView, accessoryButtonTappedForRowWithIndexPath:indexPath)
    p indexPath.row
    # case indexPath.row
    # when 0
    #   p '0'
    # else
    #   p 'else'
    # end
  end

end
