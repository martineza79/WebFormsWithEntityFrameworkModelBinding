using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsWithEntityFrameworkModelBinding
{
    public partial class ProductsEdit : System.Web.UI.Page
    {

        protected void Control_CallingDataMethods(object sender, CallingDataMethodsEventArgs e) 
        {
            e.DataMethodsObject = new WebFormsWithEntityFrameworkModelBinding.Models.ProductDB(); // This method is from the OnCallingDataMethod in the GridView and DetailsView
        }

        // Updates the GridView after delete, insert, or update operations in the DetailsView
        protected void dvProduct_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            grdProducts.DataBind(); // grdProducts is the GridViewID
        }

        protected void dvProduct_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            grdProducts.DataBind();
        }

        protected void dvProduct_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            grdProducts.DataBind(); 
        }

        // This method is needed for Bootstrap
        protected void grdProducts_PreRender(object sender, EventArgs e)
        {
            grdProducts.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    }
}