class TableController < UITableViewController

  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle 'TABLE', image:nil, tag:1
    end
    self
  end

  def viewDidLoad
    super
    self.title = "Map Points"
  end

  def tableView(tableView, numberOfRowsInSection:section)
    Point::All.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:nil).tap do |cell|
      cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton
      cell
    end
    point = Point::All[indexPath.row]
    cell.textLabel.text = point.name
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    point = Point::All[indexPath.row]
    @subview_controller ||= SubviewController.alloc.init
    @subview_controller.detail point
    self.navigationController.pushViewController(@subview_controller, animated:true)
  end

  def tableView(tableView, accessoryButtonTappedForRowWithIndexPath:indexPath)
    p indexPath.row
  end

end
