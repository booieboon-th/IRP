<%@ Page Language="C#" Inherits="System.Web.UI.Page" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>IRP Incident v4</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // Add your JavaScript for handling REST API calls and inline editing here
        function saveData() {
            // Function to save data using SharePoint REST API
        }

        function cancelEdit() {
            // Function to cancel editing
        }

        function deleteEntry() {
            // Function to delete an entry
        }

        function addEntry() {
            // Function to add a new entry
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Incident Details</h1>
            <table>
                <!-- Enhanced layout with proper column widths -->
                <tr>
                    <td><label for="incidentTitle">Incident Title:</label></td>
                    <td><input type="text" id="incidentTitle" class="editable" /></td>
                </tr>
                <!-- More rows... -->
            </table>
            <button type="button" onclick="addEntry()">Add</button>
            <button type="button" onclick="saveData()">Save</button>
            <button type="button" onclick="cancelEdit()">Cancel</button>
            <button type="button" onclick="deleteEntry()">Delete</button>
        </div>

        <div>
            <h1>Events</h1>
            <!-- Implement Event section similarly -->
        </div>

        <div>
            <h1>Objectives</h1>
            <!-- Implement Objectives section -->
        </div>

        <div>
            <h1>Actions</h1>
            <!-- Implement Actions section -->
        </div>

        <div>
            <h1>Responding Team</h1>
            <!-- Implement Responding Team section -->
        </div>
    </form>
</body>
</html>

<style>
    .editable {
        width: 100%;
        max-width: 400px;
        /* Additional styles */
    }
    /* Add CSS for mobile/tablet responsive layouts */
</style>